require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        post_type: "Post Type",
        image: "Image",
        text: "Text"
      ),
      Post.create!(
        post_type: "Post Type",
        image: "Image",
        text: "Text"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", text: "Post Type".to_s, count: 2
    assert_select "tr>td", text: "Image".to_s, count: 2
    assert_select "tr>td", text: "Text".to_s, count: 2
  end
end
