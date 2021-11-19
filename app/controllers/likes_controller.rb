class LikesController < ApplicationController

  def create
    like = Current.user.likes.create(post_params)
  end 

  def delete_like
    Like.destroy_by(post_params)
  end

  def liked
    Like.where(post_params)
  end 
  
  private 

  def post_params
    params.require(:like).permit(:post_id, :user_id)
  end    

end
