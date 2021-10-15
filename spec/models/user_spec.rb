require 'rails_helper'

RSpec.describe User, type: :model do

  subject { described_class.new(
    first_name: "Harry",
    last_name: "Styles",
    email: "harry@example.com",
    password: "password",
    id: 1
  )}

  it "is valid with valid attributes" do 
    expect(subject).to be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  #Still need to test for valid first_name, last_name and password

end
