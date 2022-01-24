class PostsController < ApplicationController
  # def new
  #   @post = Post.new
  # end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @post = Post.new # this was the code in the new route
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_url
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path, status: :see_other #this will need to change to post_path. how to delete a post that has comments?
  end
  
  private

  def post_params
    params.require(:post).permit(:message)
  end

end
