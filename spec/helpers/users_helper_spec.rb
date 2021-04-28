require 'rails_helper'

def sign_up(username)
  visit "/"
  click_link "Sign Up"
  fill_in "user_username", with: username
  fill_in "user_password", with: "password"
  attach_file "user_image", "./spec/fixtures/pikachu.png"
  click_on "user-signup-submit"
end

def log_out
  click_link "Log Out"
end
