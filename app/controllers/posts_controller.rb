class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def get
    @post = Post.find(params["id"])
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
