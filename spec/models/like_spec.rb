require 'rails_helper'

RSpec.describe Like, type: :model do
  like = Like.new(11, 22)

  it "has a user id" do
    expect(like.user_id).to eq(11)
  end

  it "has a post id" do
    expect(like.post_id).to eq(22)
  end
  
end
