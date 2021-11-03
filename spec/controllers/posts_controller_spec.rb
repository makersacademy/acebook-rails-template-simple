require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      allow(controller).to receive(:logged_in?) { true }
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      allow(controller).to receive(:logged_in?) { true }

      user = User.create(username: "user", password: "password", id: 1)
      
      allow(controller).to receive(:current_user) { user }
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      allow(controller).to receive(:logged_in?) { true }

      user = User.create(username: "user", password: "password", id: 1)

      allow(controller).to receive(:current_user) { user }
      post :create, params: { post: { message: "Hello, world!" }}
      expect(Post.find_by(message: "Hello, world!")).to be
      expect(Post.find_by(user_id: 1)).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      allow(controller).to receive(:logged_in?) { true }
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
