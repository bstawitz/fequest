require 'rails_helper'

RSpec.describe "features/new", type: :view do
  before(:each) do
    assign(:feature, build(:feature))
  end

  it "renders the feature form" do
    render
    expect(rendered).to match(/features/)
  end

  it "renders the feature form fields" do
    render
    expect(rendered).to match(/feature_title/)
    expect(rendered).to match(/feature_body/)
  end
end
