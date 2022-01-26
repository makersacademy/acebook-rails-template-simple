require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }
 
  it "has a valid message" do
    user = User.new(username: 'posts_test_user',
      email: "posttest@test.com",
      password: "123456",)
    post = Post.new(user: user, message: "This is my first post")

    expect(post).to be_valid
  end

  it "does not have a valid message" do
    user = User.new(username: 'posts_test_user',
      email: "posttest@test.com",
      password: "123456",)
    post = Post.new(user: user, message: "")

    expect(post).to_not be_valid
  end

  it "message is less than 200 char" do
    user = User.new(username: 'posts_test_user',
      email: "posttest@test.com",
      password: "123456",)
    post = Post.new(user: user, message: "a" * 11)
    expect(post).to be_valid
  end


  it "message is greater than 200 char" do
    user = User.new(username: 'posts_test_user',
      email: "posttest@test.com",
      password: "123456",)
    post = Post.new(user: user, message: "a" * 201)
    expect(post).to_not be_valid
  end

end
