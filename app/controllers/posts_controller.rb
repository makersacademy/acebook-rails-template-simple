class PostsController < ApplicationController
  before_action :restrict_access

  
    def index
      @all_posts = Post.all
      if params[:search_by_content] && params[:search_by_content] != ""
        @all_posts = @all_posts.where("content LIKE ?", "%" + params[:search_by_content] + "%")
      end

      if params[:search_by_user] && params[:search_by_user] != ""
        user_search_id = User.find_by(name: params[:search_by_user].capitalize)
        @all_posts = @all_posts.where("users_id LIKE ?", user_search_id)
      end
    end

  def show
    @posts = Post.find(params[:id])
    redirect_to '/'
  end

  def create
    @post_new = Post.new(content: post_params["content"], users_id: session[:current_user_id])
      if @post_new.valid?
        @post_new.save
        @post_new.post_photo.attach(post_params["post_photo"])
        flash.alert = "Post created"
      else 
        flash.alert = "Error: Post not created"
      end
      redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if session[:current_user_id] != @post.users_id
      flash.alert = "Error: You can only Edit your own Posts"
    elsif @post.update(content: post_params["content"], users_id: session[:current_user_id])
      @post.post_photo.attach(post_params["post_photo"])
      flash.alert = "Post Updated"
    else
      flash.alert = "Error: Post not updated"
    end
    redirect_to '/'
  end

  def destroy
    @post = Post.find(params[:id])
    if session[:current_user_id] == @post.users_id
      @post.destroy
    else
      flash.alert = "You can only delete your own posts"
    end
    redirect_to '/posts'
  end


  private

  def post_params
    params.require(:post).permit(:content, :post_photo, :search)
  end

  def restrict_access
    if session[:current_user_id] == nil
      redirect_to homepage_index_path
      flash.alert = "Please sign in"
    end
  end
end 