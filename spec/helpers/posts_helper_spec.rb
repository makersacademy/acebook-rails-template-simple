require 'rails_helper'

def sign_up(username)
  visit "/"
  click_link "Sign Up"
  fill_in "Username", with: username
  fill_in "Password", with: "password"
  attach_file "user_image", "./spec/fixtures/pikachu.png"
  click_button "Submit"
end

def post_message(post, username=nil)
  sign_up(username) if username
  click_link "New post"
  fill_in "Message", with: post
  click_button "Submit"
end
