class FriendshipsController < ApplicationController
  def create
      @friend_id = params[:friend_id]
      @new_friendships = Friendship.create_reciprocal_for_ids(current_user.id, params[:friend_id])
      do_not_run_js_in_test
  end
end