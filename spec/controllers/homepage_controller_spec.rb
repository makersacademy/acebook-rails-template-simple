require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
  describe "POST /" do
    it "responds with 200" do
      # users is not recognised. We are trying to reference the spec/features/users.yml file to input
      # a user into a test database. Work in Progress.
      p users(:example_user).email
      post :create, params: { email: "dagswebb@gmail.com", password: 'hello' } 
      expect(response).to redirect_to('/posts')
    end

   end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
