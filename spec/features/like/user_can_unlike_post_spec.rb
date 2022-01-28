require 'rails_helper'

RSpec.feature "Likes", type: :feature do

  describe "Unlike a post from the news feed" do
    scenario "Users can unlike his/her post" do
      user_sign_up
      create_post
      find(".like-button").click #for like
      find(".like-button").click #for unlike
      expect(page).not_to have_content(".likes")
    end

    scenario "Users can unlike a post from another user" do
      user_sign_up
      create_post
      log_out
      second_user_sign_up
      find(".like-button").click #for like
      find(".like-button").click #for unlike
      expect(page).not_to have_content(".likes")
    end
  end

  describe "Unlike a specific post" do
    scenario "Users can unlike his/her post" do
      user_sign_up
      create_post
      click_link "Hello, world!"
      find(".like-button").click #for like
      find(".like-button").click #for unlike
      expect(page).not_to have_content(".likes")
    end

    scenario "Users can unlike a post from another user" do
      user_sign_up
      create_post
      log_out
      second_user_sign_up
      click_link "Hello, world!"
      find(".like-button").click #for like
      find(".like-button").click #for unlike
      expect(page).not_to have_content(".likes")
    end
  end

end