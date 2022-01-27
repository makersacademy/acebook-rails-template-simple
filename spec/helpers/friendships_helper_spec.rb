require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the FriendshipsHelper. For example:
#
# describe FriendshipsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
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
