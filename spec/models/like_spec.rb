require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'has a like' do
  user = User.create(email: "test@test.com", password: "password", password_confirmation: "password")
  post = Post.create(message: "This is a message", user: user)
  like = Like.create(user: user, post: post)
  expect(like).to be_valid
  end

  it 'has a user and a post' do
    user = User.create(email: "test@test.com", password: "password", password_confirmation: "password")
    post = Post.create(message: "This is a message", user: user)
    like = Like.create(user: user, post: post)
    expect(like.user).to be(user)
    expect(like.post).to be(post)
  end
end
