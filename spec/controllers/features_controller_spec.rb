require 'rails_helper'

RSpec.describe FeaturesController, type: :controller do

  # GET
  describe "GET #index" do
    it "returns http success" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      sign_in create(:user)
      get :new

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      sign_in create(:user)
      feature = create(:feature)

      get :edit, params: {id: feature.id}

      expect(response).to be_success
    end
  end
  describe "GET #show" do
    it "returns a success response" do
      feature = create(:feature)

      get :show, params: {id: feature.id}

      expect(response).to be_success
    end
  end

  # POST
  describe "POST #create" do
    context "with valid params" do
      it "sbhould increase the feature count" do
        sign_in create(:user)

        feature_attributes = attributes_for(:feature)
        feature_params = {feature: feature_attributes}

        expect { post :create, params: feature_params }.to change(Feature, :count).by(1)
      end

    end

    context "with invalid params" do
      it "should redirect back to the form on error" do
        sign_in create(:user)
        feature = build(:feature, title: nil)
        feature_params = {feature: {title: feature.title, body: feature.body}}

        post :create, params: feature_params

        expect(response).to be_success
      end
    end
  end

  describe "POST #update" do
    context "with valid params" do
      it "should update the feature with the new attributes" do
        sign_in create(:user)
        feature = create(:feature)
        params = {id: feature.id, feature: { title: "new title", body: feature.body }}

        post :update, params: params

        expect(Feature.last.title).to eq("new title")
      end

      it "should show the updated feature" do
        sign_in create(:user)
        feature = create(:feature)
        params = {id: feature.id, feature: { title: feature.title, body: feature.body }}

        post :update, params: params

        expect(response).to redirect_to(feature)
        expect(flash[:notice]).to match(/^Feature was successfully updated./)
      end
    end

    context "with invalid params" do
      it "should redirect back to the form on error" do
        sign_in create(:user)
        feature = create(:feature)
        params = {id: feature.id, feature: { title: nil, body: feature.body }}

        post :update, params: params

        expect(response).to be_success
      end
    end
  end

  describe "POST #vote" do
    it "should increase upvote" do
      sign_in create(:user)
      feature = create(:feature)
      params = {id: feature.id, vote_type: :upvote}

      expect { post :vote, params: params }.to change{Feature.last.upvotes}.by(1)
    end

    it "should increase downvote" do
      sign_in create(:user)
      feature = create(:feature)
      params = {id: feature.id, vote_type: :downvote}

      expect { post :vote, params: params }.to change{Feature.last.downvotes}.by(1)
    end
  end
end
