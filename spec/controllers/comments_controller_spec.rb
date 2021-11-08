require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    allow(controller).to receive(:logged_in?) { true }
    user = User.create(username: "user", password: "password", id: 1)  
    allow(controller).to receive(:current_user) { user }
    posts = Post.create(message: "This is a post", id: 1, user_id: 1)
  end

  describe "Creating a comment" do
    it "responds with 200" do
      post :create, params: { comment: { body: "Hello, world!" }, post_id: 1 }
      expect(response).to redirect_to("/posts/1")
    end

    it "creates a comment" do
      post :create, params: { comment: { body: "Hello, world!" }, post_id: 1 }
      expect(Comment.find_by(body: "Hello, world!")).to be
      expect(Comment.find_by(post_id: 1)).to be
    end
  end
end
