class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
   @post = Post.find(params[:id])
  end

  def new

  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  private def post_params
    params.require(:post).permit(:post_content, :created_at)
  end

  


  # def new
  #   @post = Post.new
  # end

  # def show
  #   @post = Post.find(params[:id])
  # end

  # def create
  #   @post = Post.new(params[:message])
  #   @post.save
  #   redirect_to @post

  #   # @post = Post.create(post_params)
    
  # end

  # def index
  #   @posts = Post.all
  # end

  # private

  # def post_params
  #   params.require(:post).permit(:message)
  # end
end
