require 'rails_helper'

RSpec.describe "post_images/index", type: :view do
  before(:each) do
    assign(:post_images, [
      PostImage.create!(
        title: "Title",
        content: "MyText"
      ),
      PostImage.create!(
        title: "Title",
        content: "MyText"
      )
    ])
  end

  it "renders a list of post_images" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
