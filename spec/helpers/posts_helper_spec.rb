require 'rails_helper'

def post_message(post, username = nil)
  sign_up(username) if username
  fill_in "post[message]", with: post
  click_button "Submit"
end

def post_photo
  fill_in "post[message]", with: "blah blah"
  attach_file "post-image", "./spec/fixtures/granny-with-guns.jpeg"
  click_button "Submit"
end
