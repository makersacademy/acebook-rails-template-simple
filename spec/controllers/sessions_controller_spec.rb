require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET /sessions/new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /sessions/" do
    it "redirects to root on succesful login" do
      User.create(username: "ralph", password: "password", image: fixture_file_upload('./spec/fixtures/pikachu.png'))
      post :create, params: { username: "ralph", password: "password" }
      expect(response).to redirect_to(root_url)
    end

    it "redirects to root on failure" do
      User.create(username: "ralph", password: "password", image: fixture_file_upload('./spec/fixtures/pikachu.png'))
      post :create, params: { username: "ralph", password: "failword" }
      expect(response).to redirect_to(root_url)
    end
  end

end
