class PostsController < ApplicationController
  # redundant as rendering the new post form in the index
  # def new
  #   @post = Post.new
  # end

  def create
    @post = Post.create(post_params)
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def index
    @user = User.find_by(id: session[:user_id])
    @posts = Post.order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id, :image)
  end
end
