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



  private

  def post_params
    params.require(:post).permit(:message, :photo, :post_id)
  end
end
