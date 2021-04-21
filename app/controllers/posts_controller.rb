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
