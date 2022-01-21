class LikesController < ApplicationController

  

  def create
    @post = Post.find(params[:post_id])
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to posts_path(@post)
  end


  # @post.likes.create(user_id: current_user.id)
  #   redirect_to posts_path(@post)

  private 

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end


end
  

  