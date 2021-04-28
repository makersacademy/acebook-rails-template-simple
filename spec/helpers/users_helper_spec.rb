require 'rails_helper'

def sign_up(username)
  visit "/"
  click_link "Sign Up"
  fill_in "Username", with: username
  fill_in "Password", with: "password"
  attach_file "user_image", "./spec/fixtures/pikachu.png"
  click_button "Submit"
end

def log_out
  click_link "Log Out"
end
