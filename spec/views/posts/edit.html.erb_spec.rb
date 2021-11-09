require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      date_created: "MyString",
      date_updated: "MyString",
      type: "",
      image: "MyString",
      text: "MyString",
      user_id: 1
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[date_created]"

      assert_select "input[name=?]", "post[date_updated]"

      assert_select "input[name=?]", "post[type]"

      assert_select "input[name=?]", "post[image]"

      assert_select "input[name=?]", "post[text]"

      assert_select "input[name=?]", "post[user_id]"
    end
  end
end
