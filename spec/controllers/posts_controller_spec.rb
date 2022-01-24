require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "redirects to posts" do
      post :create, params: { post: { content: "Hello, world!", users_id: 1 } }
      expect(response).to redirect_to('/')
    end

    it "creates a post" do
      user = User.create(name: 'chris', email: 'chris@gmail.com', password: '123456')
      Post.create(content: "Hello, world!", users_id: 1)
      expect(Post.find_by(content: "Hello, world!")).to_not be nil
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
