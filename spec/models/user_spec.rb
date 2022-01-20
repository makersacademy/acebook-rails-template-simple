require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "upload avatar" do
    before do
      @user = User.create(id: 1, email: "test")
      @user.avatar.attach(io: File.open("lib/assets/Scooby-Doo_test_picture.png"), 
      filename: "Scooby-Doo_test_picture.png", content_type: "image/png")
    end 

    it "Img added to user model" do
      expect(@user.avatar.attached?).to be true
      expect(@user.avatar.filename).to eq("Scooby-Doo_test_picture.png")
    end

    it "Img replaced when another is attached " do
      @user.avatar.attach(io: File.open("lib/assets/ShaggyRogers_test_picture.png"), 
      filename: "ShaggyRogers_test_picture.png", content_type: "image/png"

      expect(@user.avatar.attached?).to be true
      expect(@user.avatar.filename).to eq("ShaggyRogers_test_picture.png")
    end
  end
end
