require 'rails_helper'

RSpec.describe User, type: :model do
  it 'must have a email to create new user' do
    user = User.create(email: "", password: "password", password_confirmation: "password")
    expect(user).to_not be_valid
  end

  it 'must have a body to create new instance' do
    user = User.create(email: "test@test.com", password: "password", password_confirmation: "password")
    expect(user).to be_valid
  end
  
  it 'must have a body to create new instance' do
    user = User.create(email: "test@test.com", password: "password", password_confirmation: "assword")
    expect(user).to_not be_valid
  end
end
