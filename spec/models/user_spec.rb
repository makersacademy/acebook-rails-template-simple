require 'rails_helper'



RSpec.describe User, type: :model do
  subject {
    User.new(name: "Michael",
             email: "Michael@gmail.com",
            created_at: DateTime.now,
            updated_at: DateTime.now,
            password: "1234567",
            password_confirmation: "1234567",
            id: 1)
    }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    user_2 = User.new(name: nil, email:"email")
    expect(user_2).to_not be_valid
  end

  it "is not valid without a email" do
    user_1 = User.new(name:"person", email: nil)
    expect(user_1).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

end
