require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  
  describe "POST SESSION#create" do
    it "creates" do
      user = User.create(email: "example@example.com", password: "password", password_confirmation: "password")

      post :create, params: { email: "example@example.com", password: "password"  }
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "POST SESSION#delete" do
    it "deletes" do
      User.create(email: "example@example.com", password: "password", password_confirmation: "password")

      post :create, params: { email: "example@example.com", password: "password"  }
      post :delete

      expect(session[:user_id]).to eq(nil)
    end
  end
end
