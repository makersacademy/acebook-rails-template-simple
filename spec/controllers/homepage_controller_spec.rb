require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
  describe "POST /" do

    it "redirects to posts if details are correct" do
      user = User.create!(name: 'chris', email: 'chris@gmail.com', password: '123456')
      post :create, params: { email: 'chris@gmail.com', password: '123456' } 
      expect(response).to redirect_to('/posts')
    end

    it "redirects to homepage if details are incorrect" do
      post :create, params: { email: "not_an_email@gmail.com", password: 'bad_password' } 
      expect(response).to redirect_to('/homepage')
    end

   end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
