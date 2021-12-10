class LikesController < ApplicationController
  before_action :find_post 
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(user_id: Current.user.id)
    end
    redirect_to posts_path(@post)
  end 
  
  private 

  def destroy 
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      find_like
      @like.destroy
    end
    redirect_to posts_path(@post)
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end


  def already_liked?
    Like.where(user_id: Current.user.id, post_id:
    params[:post_id]).exists?
  end


  def find_post
    @post = Post.find(params[:post_id])
  end 
  
end
