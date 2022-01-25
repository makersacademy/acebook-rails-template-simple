class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to posts_url # Redirect to list of friends page
    else
      flash[:notice] = "Unable to add friend."
      redirect_to posts_url # Redirect to list of friends page
    end
  end

  def destroy
    @friendship = current_user.friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friend."
    redirect_to posts_url # Redirect to list of friends page
  end
end
