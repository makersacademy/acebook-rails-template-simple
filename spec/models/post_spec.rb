require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it "has a valid message" do
    post = Post.new(message: "This is my first post")

    expect(post).to be_valid
  end

  it "does not have a valid message" do
    post = Post.new(message: "")

    expect(post).to_not be_valid
  end

  it "message is greater than 10 char" do
    post = Post.new(message: "a" * 11)
    expect(post).to be_valid
  end

  it "message is less than 10 char" do
    post = Post.new(message: "a" * 9)
    expect(post).to_not be_valid
  end

  it "message is greater than 200 char" do
    post = Post.new(message: "a" * 201)
    expect(post).to_not be_valid
  end

end
