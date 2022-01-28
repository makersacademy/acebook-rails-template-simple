require 'rails_helper'

RSpec.describe FriendshipsHelper, type: :helper do
  it "should return true if two users are already friends" do
    user1 = User.create(name: "Zoe", email: "zoe@gmail.com", password: "123456", password_confirmation: "123456")
    user2 = User.create(name: "Sarah", email: "sarah@gmail.com", password: "1234567", password_confirmation: "1234567")
    
    Friendship.create_reciprocal_for_ids(user1.id, user2.id)
    expect(helper.already_friends?(user1.id, user2.id)).to be true
  end
  
  it "should return false if two users are not friends" do
    user1 = User.create(name: "Zoe", email: "zoe@gmail.com", password: "123456", password_confirmation: "123456")
    user2 = User.create(name: "Sarah", email: "sarah@gmail.com", password: "1234567", password_confirmation: "1234567")
    
    expect(helper.already_friends?(user1.id, user2.id)).to be false
  end
end
