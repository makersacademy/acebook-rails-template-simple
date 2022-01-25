class LikesController < ApplicationController

  before_action :must_be_logged_in

  before_action :find_post


  def create
    current_user.likes.create(post_id: @post.id)
    # @post.likes.create(user_id: current_user.id)
    redirect_to posts_path
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_to posts_path
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end
end
