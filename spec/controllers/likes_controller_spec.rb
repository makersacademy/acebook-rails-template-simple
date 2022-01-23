require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  describe "POST /" do
    it "responds with 200" do
      user = User.create(email: "example@example.com", password: "password", password_confirmation: "password")
      post1 = Post.create(message: "This is a post", user_id: user.id)
      post :create, params: { post_id: post1.id }, session: { user_id: user.id }
      expect(response).to redirect_to("/posts/#{post1.id}")
    end

    it "creates a like" do
      user = User.create(email: "example@example.com", password: "password", password_confirmation: "password")
      post1 = Post.create(message: "This is a post", user_id: user.id)
      post :create, params: { post_id: post1.id }, session: { user_id: user.id }
      expect(Like.find_by(post_id: post1.id, user_id: user.id)).to be
    end
  end
end
