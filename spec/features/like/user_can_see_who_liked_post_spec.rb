require 'rails_helper'

RSpec.feature "Likes", type: :feature do

  describe "user can see who liked a post after liking it" do
    scenario "1 like on the post" do
      user_sign_up
      create_post
      click_button "Like"
      expect(page).to have_content "Inigo"
    end

    scenario "2 likes on the same post" do
      user_sign_up
      create_post
      click_button "Like"
      log_out
      second_user_sign_up
      click_button "Like"
      expect(page).to have_content "You and Inigo"
    end

    scenario "3 likes on the same post" do
      user_sign_up
      create_post
      click_button "Like"
      log_out
      second_user_sign_up
      click_button "Like"
      log_out
      third_user_sign_up
      click_button "Like"
      expect(page).to have_content "You, Kim and 1 other"
    end
  end

  describe "user can see who liked a post without liking it" do
    scenario "1 like on the post" do
      user_sign_up
      create_post
      click_button "Like"
      log_out
      second_user_sign_up
      expect(page).to have_content "Inigo"
    end

    scenario "2 likes on the same post" do
      user_sign_up
      create_post
      click_button "Like"
      log_out
      second_user_sign_up
      click_button "Like"
      third_user_sign_up
      expect(page).to have_content "Kim and 1 other"
    end

    scenario "3 likes on the same post" do
      user_sign_up  # Inigo
      create_post
      click_button "Like"
      log_out
      second_user_sign_up # Kim
      click_button "Like"
      log_out
      third_user_sign_up # Sarah
      click_button "Like"
      log_out
      fourth_user_sign_up # Evie
      expect(page).to have_content "Sarah and 2 others"
    end
  end
end
