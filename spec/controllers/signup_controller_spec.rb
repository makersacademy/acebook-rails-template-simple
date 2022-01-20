require 'rails_helper'

RSpec.describe SignupController, type: :controller do
  describe "POST /" do
    it "responds with 200" do
      post :create, params: { name: "Chris", email: "chris@gmail.com", password: '123' } 
      expect(response).to redirect_to('/homepage')
    end

    it "creates a User when all required parameters are filled" do
      post :create, params: { name: "Chris", email: "chris@gmail.com", password: '123' }
      expect(User.find_by(email: "chris@gmail.com").name).to eq "Chris"
      expect(User.find_by(email: "chris@gmail.com").email).to eq "chris@gmail.com"
    end

    it "does NOT create a User if any required parameters are NOT filled" do
      post :create, params: { email: "chris@gmail.com", password: '123' }
      expect(User.find_by(email: "chris@gmail.com")).to be_nil
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
