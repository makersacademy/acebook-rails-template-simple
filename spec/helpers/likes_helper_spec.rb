require 'rails_helper'

def like_post
  click_button "That's nice, sweetie"
end

def log_out_sign_up_and_like(username)
  log_out
  sign_up(username)
  like_post
end
