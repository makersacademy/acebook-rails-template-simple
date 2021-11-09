require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        date_created: "Date Created",
        date_updated: "Date Updated",
        type: "Type",
        image: "Image",
        text: "Text",
        user_id: 2
      ),
      Post.create!(
        date_created: "Date Created",
        date_updated: "Date Updated",
        type: "Type",
        image: "Image",
        text: "Text",
        user_id: 2
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", text: "Date Created".to_s, count: 2
    assert_select "tr>td", text: "Date Updated".to_s, count: 2
    assert_select "tr>td", text: "Type".to_s, count: 2
    assert_select "tr>td", text: "Image".to_s, count: 2
    assert_select "tr>td", text: "Text".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
