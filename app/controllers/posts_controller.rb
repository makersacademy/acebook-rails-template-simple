class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
    flash[:message] = "Nice post, friend!"
  end

  def index # this is the home page (/posts)
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params["id"])
  end

  def showSpecificUsersPost
    @users_posts = Post.where(user_id: params[:user_id]) # SELECT * FROM posts, WHERE user_id = params[:user_id]
    @username = profile_username
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
