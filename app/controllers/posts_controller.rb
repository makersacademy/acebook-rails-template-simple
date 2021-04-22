class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url(@post)
  end

  def index
    @posts = Post.order('created_at': :desc)
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end

# RSpec.describe "Widget management", :type => :request do
#   it "creates a Widget and redirects to the Widget's page" do
#     get "/widgets/new"

#     expect(response).to have_http_status(:ok)

#     post "/widgets", :params => { :widget => {:name => "My Widget"} }
#     expect(response).to have_http_status(302)
#     follow_redirect!
#     expect(response).to have_http_status(:success)
#   end
# end
