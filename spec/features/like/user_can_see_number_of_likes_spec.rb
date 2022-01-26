require 'rails_helper'

RSpec.feature "Likes", type: :feature do

    scenario "Users can like his/her post" do
      user_sign_up
      create_post
      click_button "Like"
      expect(page).to have_content("1 Like")
    end

    scenario "Users can like a post from another user" do
      user_sign_up
      create_post
      click_button "Like"
      log_out
      second_user_sign_up
      click_button "Like"
      expect(page).to have_content("2 Likes")
    end

end