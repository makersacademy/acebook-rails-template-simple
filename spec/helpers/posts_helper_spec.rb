require 'rails_helper'

def post_message(post, username=nil)
  sign_up(username) if username
  click_link "New post"
  fill_in "Message", with: post
  click_button "Submit"
end
