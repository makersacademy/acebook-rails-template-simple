require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      post_type: "MyString",
      image: "MyString",
      text: "MyString"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input[name=?]", "post[post_type]"

      assert_select "input[name=?]", "post[image]"

      assert_select "input[name=?]", "post[text]"
    end
  end
end
