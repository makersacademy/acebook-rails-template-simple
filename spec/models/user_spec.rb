require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:likes).dependent(:destroy) }
  it { should validate_presence_of(:forename)}
end