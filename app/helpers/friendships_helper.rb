module FriendshipsHelper

  def already_friends?(user_id, friend_id)
    user = User.find(user_id)
    
    user.friendships.map { |f| f.friend_id }.include?(friend_id)
  end

  def is_self?(user_id)
    user_id == current_user.id
  end

end
