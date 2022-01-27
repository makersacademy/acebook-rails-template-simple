module FriendshipsHelper

  def already_friends?(user_id, friend_id)
    user = User.find(user_id)
    
    user.friendships.select{ |f| f.request == true }.map { |f| f.friend_id }.include?(friend_id)
  end

  def is_self?(user_id)
    user_id == current_user.id
  end

  def accept_request(user_id, friend_id)
    user = User.find(user_id)
    user.friendships.find_by(friend_id: friend_id).update(request: true)

    friend = User.find(friend_id)
    friend.friendships.find_by(friend_id: user_id).update(request: true)
  end

  def pending_request(user_id, friend_id)
    user = User.find(user_id)
    
    user.friendships.select{ |f| f.request == nil }.map { |f| f.friend_id }.include?(friend_id)
  end
  

  def can_add_as_friend(user_id, friend_id)
    !(already_friends?(user_id, friend_id) || is_self?(friend_id) || pending_request(user_id, friend_id))
  end

  def my_friends(user_id)
    user = User.find(user_id)
    user.friendships.select{ |f| f.request == true }
  end

  def my_friends_post(user_id)
    my_friends(user_id).map{ |friend| User.find(friend.friend_id) }.map{ |friend| friend.posts }.flatten.sort_by {|post| post.created_at}.reverse
  end
end
