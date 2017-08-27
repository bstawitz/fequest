require 'rails_helper'

RSpec.describe "features/show", type: :view do
  before(:each) do
    @feature = assign(:feature, create(:feature))
    @comments = assign(:comments, create_list(:comment, 3))
  end

  # FEATURES
  it "renders feature" do
    render
    expect(rendered).to match(/#{@feature.title}/)
  end

  # COMMENTS
  it "renders comments" do
    render
    expect(rendered).to match(/#{@comments.first.body}/)
  end

  it "renders comment form" do
    render
    expect(rendered).to match(/comment_body/)
  end
end
