class PostsController < ApplicationController

  before_action :find_post, only: [:update, :edit]

  def new
    @post = Post.new
  end

  def index
    @pagy, @posts = pagy(Post.all.order(created_at: :desc), items: 5)
    @like = Like.new
  end

  def show
   @post = Post.find(params[:id])
  end

  def create
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
    params.require(:post).permit(:message, :created_at)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
