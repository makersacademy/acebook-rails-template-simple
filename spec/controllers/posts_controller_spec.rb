require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /" do
    # patch  "/posts/:id(.:format)", to: "posts#update"
    it "method patch,route /post/:id/edit to update action" do
      post :create, params: { post: { message: "Hello, world!" } }
      @post = Post.find_by(message: "Hello, world!")
      # The recognized options <{"controller"=>"posts", "action"=>"update", "id"=>"73"}>
      expect(patch: "/posts/#{@post.id}").to route_to("posts#update", "id"=>"#{@post.id}")
    end
  end
end
