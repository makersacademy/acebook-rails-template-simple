require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
  describe "POST /" do

    let(:user) { User.create!(name: 'chris', email: 'chris@gmail.com', password: '123') }

    it "redirects to posts if details are correct" do
      p "TESTING TEST DATABASE"
      p User.all
      # users is not recognised. We are trying to reference the spec/features/users.yml file to input
      # a user into a test database. Work in Progress.
      # p users(:example_user).email
      # Issue is user needs to have an account in the test database for the below to pass. 
      post :create, params: { email: 'chris@gmail.com', password: '123' } 
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
