require 'rails_helper'

RSpec.describe SignUpsController, type: :controller do
  describe "GET /sign_ups " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200 when successfully signing up" do
      post :create, params: { user: { email: "example@example.com", password: "password", password_confirmation: "password" } }
      expect(response).to redirect_to(posts_url)
    end

    it "responds with 200 when sign up not successful" do
      post :create, params: { user: { email: "example@example.com", password: "password", password_confirmation: "passwo1234" } }
      expect(response).to have_http_status(200)
    end

    it "creates a user" do
      post :create, params: { user: { email: "example@example.com", password: "password", password_confirmation: "password" } }
      expect(User.find_by(email: "example@example.com")).to be
    end
  end
end
