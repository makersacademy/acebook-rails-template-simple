require 'rails_helper'

RSpec.describe Friendship, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"


  it 'allows a user to add a friend'

  user1 = User.new(id: 1, username: 'user1',
    email: "test@test.com",
    password: "123456",)

  user2 = User.new(id:2, username: 'user2',
      email: "test@test.com",
      password: "123456",)

    

  friends = Friendship.new(id:1, user_id: user1.id, friend_id: user2.id) 

  
  test = user1.friendships

  p user1.friends.find(2)


end
