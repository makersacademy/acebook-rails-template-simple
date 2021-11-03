class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(message: post_params["message"])
    redirect_to posts_url
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
