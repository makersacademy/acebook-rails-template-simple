require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "POST /" do
    it "responds with 200" do
      user = User.create(email: "example@example.com", password: "password", password_confirmation: "password")
      post1 = Post.create(message: "This is a post", user_id: user.id)
      post :create, params: { comment: { body: "this is a comment" }, post_id: post1.id }, session: { user_id: user.id }
      expect(response).to redirect_to("/posts/#{post1.id}")
    end

    it "creates a comment" do
      user = User.create(email: "example@example.com", password: "password", password_confirmation: "password")
      post1 = Post.create(message: "This is a post", user_id: user.id)
      post :create, params: { comment: { body: "this is another comment" }, post_id: post1.id }, session: { user_id: user.id }
      expect(Comment.find_by(body: "this is another comment")).to be
    end
  end
end
