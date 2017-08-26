require 'rails_helper'

RSpec.describe FeaturesController, type: :controller do

  # GET
  %w( new index ).each do |action|
    describe "GET ##{action}" do
      it "returns http success" do
        get action.to_sym
        expect(response).to be_success
      end
    end
  end

  %w( edit show ).each do |action|
    describe "GET ##{action}" do
      it "returns a success response" do
        company = create(:feature)
        get action.to_sym, params: {id: feature.to_param}
        expect(response).to be_success
      end
    end
  end

  # POST
  describe "POST #create" do
    context "with valid params" do
      it "sbhould increase the feature county" do
        feature_attributes = attributes_for(:feature)
        feature_params = {feature: feature_attributes}

        post :create, params: feature_params

        expect { response  }.to change(Feature, :count).by(1)
      end

    end

    context "with invalid params" do
    end
  end

  describe "POST #update" do
    context "with valid params" do
      it "should update the record" do

      end
    end

    context "with invalid params" do
    end

  end

end
