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
    if session[:order] == 'likes'
      @posts = Post.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC, created_at DESC')
    else
      @posts = Post.order(created_at: :desc)
    end
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

  def search
    if params[:search].blank?
      redirect_to posts_url
    else
      @parameter = params[:search].downcase
      @results = Post.all.where("lower(message) LIKE :search", search: "%#{@parameter}%")
    end
  end

  def search_post
    if params[:search].blank?
      redirect_to posts_url
    else
      redirect_to("/posts/search/#{params[:search]}")
    end
  end

  def order
    if session[:order] == 'recent'
      session[:order] = 'likes'
    else
      session[:order] = 'recent'
    end
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :image)
  end
end
