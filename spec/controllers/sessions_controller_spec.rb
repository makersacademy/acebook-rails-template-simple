require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "POST /" do
    it "redirects to /login when user details are not confirmed" do
      post :create, params: { username: 'user', password: 'passwordincorrect'} 
      expect(response).to redirect_to(login_url)
    end

    it "redirects to /posts when user details are confirmed" do
      User.create({username: 'user', password: 'password'})
      post :create, params: { username: 'user', password: 'password'} 
      expect(response).to redirect_to(posts_url)
    end
  end

  describe "DELETE /" do
    it "redirects to /welcome" do
      User.create({username: 'user', password: 'password'})
      post :create, params: { username: 'user', password: 'password'} 
      delete :destroy
      expect(response).to redirect_to(welcome_url)
    end
  end
end
