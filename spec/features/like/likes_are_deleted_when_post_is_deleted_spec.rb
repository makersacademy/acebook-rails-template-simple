require 'rails_helper'

RSpec.feature "Likes", type: :feature do

  describe "Likes are deleted when the post is deleted" do
    scenario "a post has many likes" do
      user_sign_up
      create_post
      find(".like-button").click
      log_out
      second_user_sign_up
      find(".like-button").click
      log_out

      user_log_in
      visit "/posts"
      click_link "Delete"
      expect(page).not_to have_content("Hello, world!")
      expect(page).not_to have_content(".likes")
    end
  end
end