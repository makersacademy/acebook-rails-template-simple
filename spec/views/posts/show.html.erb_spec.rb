require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      post_type: "Post Type",
      image: "Image",
      text: "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Post Type/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Text/)
  end
end
