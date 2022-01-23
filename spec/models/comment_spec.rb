require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to be }

  it 'must have a body to create new instance' do
    post = Post.create(message: "This is a message")
    comment = Comment.create(body: "", post: post)
    expect(comment).to_not be_valid
  end

  it 'has a body instance variable' do
    user = User.create(email: "test@test.com", password: "password", password_confirmation: "password")
    post = Post.create(message: "This is a message", user: user)
    comment = Comment.create(body: "This is a body", post: post, user: user)
    expect(comment).to be_valid
  end

  it 'has a body instance variable' do
    user = User.create(email: "test@test.com", password: "password", password_confirmation: "password")
    post = Post.create(message: "This is a message", user: user)
    comment = Comment.create(body: "This is a body", post: post, user: user)
    expect(comment.post).to be(post)
    expect(comment.user).to be(user)
  end
end
