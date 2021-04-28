require 'rails_helper'

def sign_up(username)
  visit "/"
  click_link "Sign Up"
  fill_in "user_username", with: username
  fill_in "user_password", with: "Password88"
  click_button "user-signup-submit"
end

def post_message(post, username = nil)
  sign_up(username) if username
  fill_in "post[message]", with: post
  click_button "Submit"
end
