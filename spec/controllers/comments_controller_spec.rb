require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @user = User.create(username: "test", password: "1234")
    @post = Post.create(message: "Hello, world!", user_id: @user.id)
  end
  # No Mocking - to look at

  # removed new rout test no longer required
  # describe "Get /posts/:post_id/comments/new" do
  #   it "responds with 200" do
  #     get :new, params: { :post_id => @post.id }
  #     expect(response).to have_http_status(200)
  #     expect(response.content_type).to eq "text/html; charset=utf-8"
  #   end
  # end

  describe "POST /posts/:post_id/comments" do
    it "responds with 200" do
      post :create, params: { post_id: @post.id, comment: { user_id: @user.id, body: "This is a comment!",  post_id: @post.id } }
      expect(response).to redirect_to(post_comments_path(@post))
    end

    it "creates a comment" do
      post :create, params: { post_id: @post.id, comment: { user_id: @user.id, body: "This is a comment!",  post_id: @post.id } }
      expect(Comment.find_by(body: "This is a comment!")).to be
    end
  end

  describe "GET /posts/:post_id/comments" do
    it "responds with 200" do
      get :index, params: { :post_id => @post.id }
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq "text/html; charset=utf-8"
      # expect(response).to render_template(:index) # need gem rails-controller-testing for controller.
    end
  end
end
