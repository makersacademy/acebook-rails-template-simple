require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it "not valid if post has neither a message or a image" do
    post = Post.new()

    expect(post).to_not be_valid
  end

  it "has a valid message" do
    post = Post.new(message: "This is my first post")

    expect(post).to be_valid
  end

  it "message is less than 200 char" do
    post = Post.new(message: "a" * 11)

    expect(post).to be_valid
  end


  it "message is greater than 200 char" do
    post = Post.new(message: "a" * 201)
    expect(post).to_not be_valid
  end

  it "image can be attached to a post" do
    post = Post.new()
    post.image.attach(io: File.open("lib/assets/Scooby-Doo_test_picture.png"), 
    filename: "Scooby-Doo_test_picture.png", content_type: "image/png")

    expect(post.image.attached?).to be true
    expect(post.image.filename).to eq("Scooby-Doo_test_picture.png")
    expect(post).to be_valid
  end

  it "image and message can be attached to a post" do
    post = Post.new(message: "Test")
    post.image.attach(io: File.open("lib/assets/Scooby-Doo_test_picture.png"), 
    filename: "Scooby-Doo_test_picture.png", content_type: "image/png")

    expect(post.message).to eq('Test')
    expect(post.image.attached?).to be true
    expect(post.image.filename).to eq("Scooby-Doo_test_picture.png")
    expect(post).to be_valid
  end

end
