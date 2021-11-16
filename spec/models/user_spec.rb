require 'rails_helper'

RSpec.describe User, type: :model do

  subject {
    described_class.new(first_name: "Joe",
                        last_name: "Bloggs",
                        date_of_birth: 1985-03-14,
                        email: "jbloggs1@gmail.com",
                        password_digest: "hashed_password")
          }

  describe "Validations" do 
    it "is valid with valid attributes" do 
      expect(subject).to be_valid
    end

    it "is not valid without a first name" do 
      subject.first_name = nil
      expect(subject).to_not be_valid
    end 

    it "is not valid without a last name" do 
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email address" do 
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a date of birth" do 
    subject.date_of_birth = nil
    expect(subject).to_not be_valid
    end

    it "is not valid without a password" do 
    subject.password_digest = nil
    expect(subject).to_not be_valid
    end
  
  end
  
  describe "Associations" do 
    it "should have many posts" do  
      should have_many(:posts).
      class_name("Post")
    end 
    it "should have many likes" do  
      should have_many(:likes).
      class_name("Like")
    end 
    it "should have many comments" do  
      should have_many(:comments).
      class_name("Comment")
    end 
  end 

end
