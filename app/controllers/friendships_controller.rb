class FriendshipsController < ApplicationController

  def create

    
      # filter if that relationship already exists ? friendship btn gives params user_id == current_user and friend_id
        #if params.include?(friend_id) => true or false?
          # X Friendship.find_by(friend_id) => just first match
          # X Friendship.each do |f| f.user_id = 1 ? "lisa is my friend" : "no friend" end
          # worked: user1.friendships => gives back all the friendships  ONE ARRAY  user1.friendships.each do |f| p f.user.name end
          # current_user.friendships ?
        friend = User.find(params[:friend_id])
        test_arr = friend.friendships.map{ |f|
          f.user.name == current_user.name    
        }
        if test_arr.include(true) ? p "you are already friends!" : Friendship.create_reciprocal_for_ids(current_user.id, params[:friend_id])
  end
end
