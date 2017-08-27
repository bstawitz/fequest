require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "POST #create" do
    context "when valid" do
      it "should increase the comment count" do
        comment = create(:comment)
        comment_params = {feature_id: comment.feature_id ,comment: {body: comment.body}}

        expect { post :ajax_create, params: comment_params, :format => 'js' }.to change(Comment, :count).by(1)
      end


      it "redirects to feature" do
        comment = create(:comment)
        comment_params = {feature_id: comment.feature_id ,comment: {body: comment.body}}

        post :ajax_create, params: comment_params, :format => 'js'

        expect(response).to redirect_to(comment.feature)
      end


      it "redirects with flash" do
        comment = create(:comment)
        comment_params = {feature_id: comment.feature_id ,comment: {body: comment.body}}

        post :ajax_create, params: comment_params, :format => 'js'

        expect(flash[:notice]).to match(/^Comment was created/)
      end
    end

    context "when invalid" do
      it "should not increase the comment count" do
        comment = create(:comment)
        comment_params = {feature_id: comment.feature_id ,comment: {body: nil}}

        expect { post :ajax_create, params: comment_params, :format => 'js' }.to change(Comment, :count).by(0)
      end


      it "redirects to feature" do
        comment = create(:comment)
        comment_params = {feature_id: comment.feature_id ,comment: {body: nil}}

        post :ajax_create, params: comment_params, :format => 'js'

        expect(response).to redirect_to(comment.feature)
      end


      it "redirects with alert" do
        comment = create(:comment)
        comment_params = {feature_id: comment.feature_id ,comment: {body: nil}}

        post :ajax_create, params: comment_params, :format => 'js'

        expect(flash[:alert]).to match(/^Comment invalid/)
      end
    end
  end

  describe "POST #delete" do
    it "should decrease the comment count" do
      comment = create(:comment)

      expect { delete :ajax_delete, params: {id: comment.id}, :format => 'js' }.to change(Comment, :count).by(-1)
    end

    it "should redirect back" do
      comment = create(:comment)
      feature = comment.feature

      post :ajax_delete, params: {id: comment.id}, :format => 'js'

      expect(response).to redirect_to(feature)
    end


    it "should show notice" do
      comment = create(:comment)

      post :ajax_delete, params: {id: comment.id}, :format => 'js'

      expect(flash[:notice]).to match(/^Comment deleted/)
    end
  end
end
