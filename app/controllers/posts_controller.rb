class PostsController < ApplicationController
  before_action :find_post, only: [:update, :edit]

  def new
    redirect_to sign_in_path unless session[:user_id]
    @post = Post.new
  end

  def index
    redirect_to sign_in_path unless session[:user_id]
    @pagy, @posts = pagy(Post.all.order(created_at: :desc), items: 5)
    @like = Like.new
  end

  def show
   redirect_to sign_in_path unless session[:user_id]
   @post = Post.find(params[:id])
  end

  def create
    redirect_to sign_in_path unless session[:user_id]
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def update
    @post.update(post_params)
    redirect_to posts_path
  end

  def edit

  end
  
  private def post_params
    params.require(:post).permit(:message, :avatar, :created_at, :user_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
