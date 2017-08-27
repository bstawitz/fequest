require 'rails_helper'

RSpec.describe "features/index", type: :view do
  before(:each) do
    @features = assign(:features, create_list(:feature, 3))
  end

  it "renders an features name" do
    allow(view).to receive_messages(:will_paginate => nil)
    render
    expect(rendered).to match(/#{@features.first.title}/)
  end

  it "has a link to the features #show" do
    allow(view).to receive_messages(:will_paginate => nil)
    render
    expect(rendered).to have_link(@features.first.title, href: feature_path(@features.first.id))
  end
end
