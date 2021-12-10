class PostsController < ApplicationController
  #def new
   # @post = Post.new
  #end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    if Current.user == nil
      redirect_to root_url, alert: "Must login to access content"
    else
      @posts = Post.all
      @post = Post.new
      @posts = Post.order(created_at: :asc)
    end
  end

  private

  def post_params
    params.require(:post).permit(:message, :created_at)
    
  end
end
