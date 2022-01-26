class PostsController < ApplicationController

  before_action :must_be_logged_in

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @user = current_user
    if @post.save
      respond_to do |format|
        format.js
      end
    end   
    
  end

  def index
    @posts = Post.newest_first
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path :anchor => "post-#{@post.id}"
      p @post.id
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
