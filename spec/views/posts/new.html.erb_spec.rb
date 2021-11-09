require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      date_created: "MyString",
      date_updated: "MyString",
      type: "",
      image: "MyString",
      text: "MyString",
      user_id: 1
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input[name=?]", "post[date_created]"

      assert_select "input[name=?]", "post[date_updated]"

      assert_select "input[name=?]", "post[type]"

      assert_select "input[name=?]", "post[image]"

      assert_select "input[name=?]", "post[text]"

      assert_select "input[name=?]", "post[user_id]"
    end
  end
end
