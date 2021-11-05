require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    allow(controller).to receive(:logged_in?) { true }
    user = User.create(username: "user", password: "password", id: 1)  
    allow(controller).to receive(:current_user) { user }
  end

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
      post :create, params: { post: { message: "Hello, world!" }}
      expect(Post.find_by(message: "Hello, world!")).to be
      expect(Post.find_by(user_id: 1)).to be
    end
  end

  describe "GET /:id" do
    it "gets a specific post when passed the post id" do
      post :create, params: { post: { message: "Hello, world!" } }
      # get the post id
      post_id = Post.all.first.id
      
      get :show, params: { id: post_id }
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /id:/like" do
    it 'should like a post when passed a post id' do
      post :create, params: { post: { message: "Hello, world!" } }

      post_id = Post.all.first.id

      get :like, params: { id: post_id }
      expect(response).to redirect_to("/posts/#{post_id}")
      expect(response).to have_http_status(302)
    end
  end

end
