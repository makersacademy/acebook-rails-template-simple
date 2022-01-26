class FriendshipsController < ApplicationController

  def create

    Friendship.create_reciprocal_for_ids(current_user.id, params[:friend_id])
      # filter if that relationship already exists ? friendship btn gives params user_id == current_user and friend_id
        #if params.include?(friend_id) => true or false?
          # X Friendship.find_by(friend_id) => just first match
          # X Friendship.each do |f| f.user_id = 1 ? "lisa is my friend" : "no friend" end
          # worked: user1.friendships => gives back all the friendships 
          # current_user.friendships ?

  end
end
