class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url(@post)
  end

  def index
    @posts = Post.order('created_at').reverse_order
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
