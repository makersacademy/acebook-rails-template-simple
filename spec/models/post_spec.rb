require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it 'has a message' do
    user = User.create(email: "test@test.com", password: "password", password_confirmation: "password")
    post = Post.new(message: "", user: user)
    expect(post).to_not be_valid
    post.message = "This is a message"
    expect(post).to be_valid
  end

  it 'has a user' do
    user = User.create(email: "test@test.com", password: "password", password_confirmation: "password")
    post = Post.new(message: "", user: user)
    expect(post.user.email).to eq "test@test.com"
  end

end
