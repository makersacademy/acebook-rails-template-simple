require 'rails_helper'

def sign_up(username)
  visit "/"
  click_link "Sign Up"
  fill_in "Username", with: username
  fill_in "Password", with: "Password88"
  click_button "Submit"
end

def log_out
  click_link "Log Out"
end
