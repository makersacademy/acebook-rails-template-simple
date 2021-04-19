class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def like
    post = Post.find(params[:post_id])
    if post.likes.nil?
      post.likes = 1
    else
      post.likes += 1
    end
    post.save!
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
