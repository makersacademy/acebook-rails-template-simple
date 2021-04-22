class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url(@post)
  end

  def index
    @user = User.find_by_id(session[:user_id])
    session[:user_id] = nil # this is framework code to be refactored out, it kills the session automatically after sign - up this is purely to show it works.
    # session seems to maintain even after closing the server or closing the page
    @posts = Post.order('created_at').reverse_order
  end

  private

  def post_params
    params.require(:post).permit(:message)
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
