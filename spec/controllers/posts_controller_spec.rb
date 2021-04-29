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
      post :create, params: { post: { message: "Hello, world!", user_id: 1 } }
      expect(response).to redirect_to(root_url)
    end
    # through using ajax, as we are instead executing Javascript instead of redirecting to, I am not sure these tests are necessary.

    it "creates a post" do
      user = User.create(username: "test", password: "1234", image: fixture_file_upload('./spec/fixtures/pikachu.png'))
      # expect(User.find_by(username: "test")).to be
      post :create, params: { post: { message: "Hello, world!", user_id: user.id } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
