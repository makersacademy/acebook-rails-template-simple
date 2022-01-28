require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  describe "Like a specific post" do
    scenario "Users can like his/her post from the news feed" do
      user_sign_up
      create_post
      find(".like-button").click
      expect(find(".likes")).to have_content "1 Like"
    end

    scenario "Users can like a post from another user from the news feed" do
      user_sign_up
      create_post
      log_out
      second_user_sign_up
      find(".like-button").click
      expect(find(".likes")).to have_content "1 Like"
    end
  end

  describe "Like a specific post" do
    scenario "Users can like his/her post" do
      user_sign_up
      create_post
      click_link "Hello, world!"
      find(".like-button").click
      expect(find(".likes")).to have_content "1 Like"
    end

    scenario "Users can like a post from another user" do
      user_sign_up
      create_post
      log_out
      second_user_sign_up
      click_link "Hello, world!"
      find(".like-button").click
      expect(find(".likes")).to have_content "1 Like"
    end
  end
end