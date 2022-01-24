class PostsController < ApplicationController
  
  def initialize
    @all_posts = Post.all
  end

  # def index
  #   # @display_posts =Post.all
  #   @all_posts = Post.all
  # end

  def show
    @posts = Post.find(params[:id])
    redirect_to '/'
    # respond_to do |format|
    #   format.html { render action: 'index'}
    # end
  end

  def create
    @post_new = Post.new(content: post_params["content"], users_id: session[:current_user_id])
    # respond_to do |format|
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
    params.require(:post).permit(:content, :post_photo)
  end
end