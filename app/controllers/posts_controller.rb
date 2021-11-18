class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Current.user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to root_path
    else
      flash[:notice] = 'There was a problem.'
    end
  end

  def index
    @posts = Post.all
  end

  def update 
    Current.user.likes.destroy_by(post_id: post_params[:post_id])
  end 


  private

  def post_params
    params.require(:post).permit(:message, :image, :post_id)
  end
end
