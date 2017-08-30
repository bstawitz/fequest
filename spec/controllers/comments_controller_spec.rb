require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "POST #create" do
    context "when valid" do
      it "should increase the comment count" do
        sign_in create(:user)
        comment = create(:comment)
        comment_params = {feature_id: comment.feature_id ,comment: {body: comment.body}}

        expect { post :create, params: comment_params, :format => 'js' }.to change(Comment, :count).by(1)
      end


      it "redirects to feature" do
        sign_in create(:user)
        comment = create(:comment)
        comment_params = {feature_id: comment.feature_id ,comment: {body: comment.body}}

        post :create, params: comment_params, :format => 'js'

        expect(response).to redirect_to(comment.feature)
      end


      it "redirects with flash" do
        sign_in create(:user)
        comment = create(:comment)
        comment_params = {feature_id: comment.feature_id ,comment: {body: comment.body}}

        post :create, params: comment_params, :format => 'js'

        expect(flash[:notice]).to match(/^Comment was created/)
      end
    end

    context "when invalid" do
      it "should not increase the comment count" do
        sign_in create(:user)
        comment = create(:comment)
        comment_params = {feature_id: comment.feature_id ,comment: {body: nil}}

        expect { post :create, params: comment_params, :format => 'js' }.to change(Comment, :count).by(0)
      end


      it "redirects to feature" do
        sign_in create(:user)
        comment = create(:comment)
        comment_params = {feature_id: comment.feature_id ,comment: {body: nil}}

        post :create, params: comment_params, :format => 'js'

        expect(response).to redirect_to(comment.feature)
      end


      it "redirects with alert" do
        sign_in create(:user)
        comment = create(:comment)
        comment_params = {feature_id: comment.feature_id ,comment: {body: nil}}

        post :create, params: comment_params, :format => 'js'

        expect(flash[:alert]).to match(/^Comment invalid/)
      end
    end
  end

  describe "DESTROY #delete" do
    it "should decrease the comment count" do
      sign_in create(:user)
      comment = create(:comment)

      expect { delete :destroy, params: {id: comment.id}, :format => 'js' }.to change(Comment, :count).by(-1)
    end

    it "should redirect back" do
      sign_in create(:user)
      comment = create(:comment)
      feature = comment.feature

      delete :destroy, params: {id: comment.id}, :format => 'js'

      expect(response).to redirect_to(feature)
    end


    it "should show notice" do
      sign_in create(:user)
      comment = create(:comment)

      delete :destroy, params: {id: comment.id}, :format => 'js'

      expect(flash[:notice]).to match(/^Comment deleted/)
    end
  end
end
