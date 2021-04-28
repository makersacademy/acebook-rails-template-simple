require 'rails_helper'

def post_message(post, username = nil)
  sign_up(username) if username
  fill_in "post[message]", with: post
  click_button "Submit"
end
