class FriendshipsController < ApplicationController
  def create
      
        @new_friendships = Friendship.create_reciprocal_for_ids(current_user.id, params[:friend_id])
    #   end
      redirect_to posts_path
  end
end