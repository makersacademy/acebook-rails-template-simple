require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
  describe "POST /" do
    it "responds with 200" do
      p "we are here"
      p users(:example_user).email
      post :create, params: { email: "dagswebb@gmail.com", password: 'hello' } 
      expect(response).to redirect_to('/posts')
    end

#     it "creates a User when all required parameters are filled" do
#       post :create, params: { name: "Chris", email: "chris@gmail.com", password: '123' }
#       p "This is the test where all params are filled"
#       p User.find_by(email: "chris@gmail.com")
#       expect(User.find_by(email: "chris@gmail.com").name).to eq "Chris"
#       expect(User.find_by(email: "chris@gmail.com").email).to eq "chris@gmail.com"
#     end

#     it "does NOT create a User if any required parameters are NOT filled" do
#       expect{post :create, params: { email: "chris@gmail.com", password: '123' }}.to raise_error
#     end
   end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
