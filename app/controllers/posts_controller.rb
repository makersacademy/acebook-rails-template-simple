class PostsController < ApplicationController
  before_action :restrict_access

  def index
    @all_posts = Post.all
    if params[:search_by_content] && params[:search_by_content] != "" 
      @all_posts = @all_posts.where("content LIKE ?", params[:search_by_content])
    end

    if params[:search_by_user] && params[:search_by_user] != ""
        # @user = User.all
        # @user.where("name LIKE ?", params[:search_by_user])
      @all_posts = @all_posts.where("users_id LIKE ?", params[:search_by_user])
    end
  end

  # def new 
  #   @comment = Comment.new(post_id: params[:post_id])
  # end

  def index
    # @display_posts =Post.all
    @all_posts = Post.all
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
        redirect_to '/'
      else 
        flash.alert = "Error: Post not created"
        redirect_to '/'
      end
  end


  private

  def post_params
    p "These are the post_params"
    p params
    params.require(:post).permit(:content, :post_photo, :search)
  end

  def restrict_access
    if session[:current_user_id] == nil
      redirect_to homepage_index_path
      flash.alert = "Please sign in"
    end
  end
end 