class PostsController < ApplicationController
  #def new
   # @post = Post.new
  #end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @post = Post.new
    @posts = Post.order(created_at: :asc)
  end

  private

  def post_params
    params.require(:post).permit(:message, :created_at)
    
  end
end
