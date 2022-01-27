require 'rails_helper'

RSpec.feature "Likes", type: :feature do

  describe "Likes are deleted when the post is deleted" do
    scenario "a post has many likes" do
      user_sign_up
      create_post
      link = page.find(".like-button")
      link.click
      #click_button "Like"
      log_out

      second_user_sign_up
      find(:css, 'card-footer-item like-button').click
      #click_button "Like"
      log_out

      visit("/")
      fill_in "session[email]", with: "fake@fake.com"
      fill_in "session[password]", with: "password123"
      click_button "Log In"
      visit "/posts"
      click_link "Hello, world!"
      click_link "Delete"
      expect(page).not_to have_content("Hello, world!")
      expect(page).not_to have_link "Like"
    end
  end
end