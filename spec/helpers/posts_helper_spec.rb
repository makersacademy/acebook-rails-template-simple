require 'rails_helper'

def sign_up(username)
  visit "/"
  click_link "Sign Up"
  fill_in "Username", with: username
  fill_in "Password", with: "Password88"
  click_button "Submit"
end

def post_message(post, username = nil)
  sign_up(username) if username
  fill_in "post[message]", with: post
  click_button "Submit"
end
