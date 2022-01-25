require 'rails_helper'

RSpec.feature "Likes", type: :feature do

  describe "Likes are deleted when the post is deleted" do
    scenario "a post has many likes" do
      user_sign_up  # 1st user : Inigo
      create_post   # "Hello, world!"
      click_button "Like"
      log_out

      second_user_sign_up # second user: Kim
      click_button "Like"
      log_out

      visit("/") # log in page  => make a webhelpers method!!! or /login page?
      fill_in "session[email]", with: "fake@fake.com"
      fill_in "session[password]", with: "password123"
      click_button "Log In" # error is here ?!?! is this a button or a link ? can't log in

      visit "/posts"
      click_link "Hello, world!"
      click_link "Delete"
      expect(page).not_to have_content("Hello, world!")
      expect(page).not_to have_link "Like"
    end
  end
end