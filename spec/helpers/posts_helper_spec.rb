require 'rails_helper'

def post_message(post, username=nil)
  sign_up(username) if username
  fill_in "post[message]", with: post
  click_button "Submit"
end

def post_photo()
  click_link "New post"
  attach_file "post_image", "./spec/fixtures/granny-with-guns.jpeg"
  click_button "Submit"
end
