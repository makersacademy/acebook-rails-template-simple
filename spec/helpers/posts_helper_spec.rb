require 'rails_helper'

def post_message(post)
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: post
  click_button "Submit"
end
