require 'rails_helper'
require './app/models/user'


RSpec.describe Post, type: :model do
  
  user = User.create(first_name: "Joe",
                    last_name: "Bloggs",
                    date_of_birth: "1985-03-14",
                    email: "jbloggs@gmail.com",
                    password_digest: "hashed_password")


  joe = User.find_by first_name: 'Joe'
  
  subject {
    described_class.new(message: "Hi guys, I'm using Acebook",
                        image_data: "Image",
                        user_id: joe.id)
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

  describe "Validations" do
    it "is valid with valid attributes" do 
      expect(subject).to be_valid
    end

    # it "is not valid without a message" do 
    #   subject.message = nil
    #   expect(subject).to_not be_valid
    # end 
  end

end
