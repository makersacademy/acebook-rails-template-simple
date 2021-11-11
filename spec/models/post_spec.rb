require 'rails_helper'

RSpec.describe Post, type: :model do
  subject {
    described_class.new(message: "Hi guys, I'm using Acebook",
                        user_id: 5)
  }

  describe "Associations" do 
    it "should have many likes" do 
      should have_many(:likes).
      class_name("Like")
    end 

    it "should have comments" do 
      should have_many(:comments).
      class_name("Comment")
    end  

    it "should belong to a user" do 
      should belong_to(:user).
      class_name("User")
    end 
  end
end
