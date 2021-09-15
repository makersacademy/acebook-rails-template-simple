require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {described_class.new('John', 'Wick', 'kissmyguns@test.com', 'test')}
  describe 'user instantiation' do
    it 'has a first name, last name, password and email' do
      expect(user.first_name).to eq 'John'
      expect(user.last_name).to eq 'Wick'
      expect(user.email).to eq 'kissmyguns@test.com'
      expect(user.password).to eq 'test'
    end
  end
end
