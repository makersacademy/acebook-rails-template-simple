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
    new
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params["id"])
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  def like
    @post = Post.all.find(params[:id])
    Like.create(user_id: current_user.id, post_id: @post.id)
    redirect_to post_path(@post)
  end

  def showSpecificUsersPost
    new
    @users_posts = Post.where(user_id: params[:user_id]).order(created_at: :desc) # SELECT * FROM posts, WHERE user_id = params[:user_id]
    @username = profile_username
  end

  private

  def post_params
    params.require(:post).permit(:message, :image)
  end
end
