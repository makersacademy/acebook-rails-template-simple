require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    allow(controller).to receive(:logged_in?) { true }
    user = User.create(username: "user", password: "password", id: 1)  
    allow(controller).to receive(:current_user) { user }
    posts = Post.create(message: "This is a post", id: 1)
  end

  describe "POST /posts" do
    it "responds with 200" do
      post :create, params: { comment: { body: "Hello, world!" } }
      expect(response).to redirect_to("/posts/1")
    end
  end



end