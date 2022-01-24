class LikesController < ApplicationController

  before_action :must_be_logged_in

  def create
    @like = current_user.likes.new(like_params)
    if !@like.save 
      flash.now[:notice] = "Unliked" # visual confirmation
    end
    redirect_to posts_path
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_to posts_path
  end

  private
  def like_params
    params.require(:like).permit(:post_id)
  end
end
