require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {described_class.new('John', 'Wick', 'kissmyguns@test.com', 'test')}
  describe 'user instantiation' do
    it 'has a first name, last name, password and email' do
      expect(user.first_name).to_eq 'John'
      expect(user.last_name).to_eq 'Wick'
      expect(user.email).to_eq 'kissmyguns@test.com'
      expect(user.password).to_eq 'test'
    end
  end




end
