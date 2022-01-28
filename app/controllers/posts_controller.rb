class PostsController < ApplicationController

  before_action :must_be_logged_in

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      do_not_run_js_in_test
    end   
    
  end

  def friends_feed
    @posts = my_friends_post(current_user.id)
    @post = Post.new

    respond_to do |format|
      format.js
    end
    
  end

  def index
    @posts = Post.newest_first
    @post = Post.new

    respond_to do |format|
      format.html
      format.js
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    do_not_run_js_in_test

    # if @post.update(post_params)
    #   redirect_to posts_path :anchor => "post-#{@post.id}"
    #   p @post.id
    # else
    #   render :edit, status: :unprocessable_entity
    # end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    do_not_run_js_in_test

  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
