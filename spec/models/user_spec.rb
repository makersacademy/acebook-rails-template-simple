require 'rails_helper'


RSpec.describe User, type: :model do
  include ActionDispatch::TestProcess::FixtureFile

before :each do
  @avatar = fixture_file_upload('Cat_2.png', 'image/png')
end

  it 'must have a email to create new user' do
    user = User.create(email: "", password: "password", password_confirmation: "password")
    expect(user).to_not be_valid
  end

  it 'must have a body which includes an avatar to create new instance' do
    user = User.create(email: "test@test.com", avatar: @avatar, password: "password", password_confirmation: "password")
    expect(user).to be_valid
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
