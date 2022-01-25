require 'rails_helper'

RSpec.feature "Profile Page", type: :feature do
  scenario "A users profile page shows only a users posts" do
    visit "/signup"
    fill_in "name", with: "Chris"
    fill_in "email", with: "chris@gmail.com"
    fill_in "password", with: "1234567"
    attach_file("profile_pic", File.join(Rails.root, '/app/assets/images/spiderman.jpeg'))
    click_button "Sign Up"
    visit "/homepage"
    fill_in "email", with: "chris@gmail.com"
    fill_in "password", with: "1234567"
    click_button "Log in" 
    visit "/posts"
    click_link "Create new post"
    fill_in "post_content", with: "Hello, world!"
    click_button "Create Post"
    click_link "Go to your profile"
    expect(page).to have_content "Comments Section", count: 1
  end
  scenario "A users profile page shows only a users posts with multiple posts" do
    visit "/signup"
    fill_in "name", with: "Chris"
    fill_in "email", with: "chris@gmail.com"
    fill_in "password", with: "1234567"
    attach_file("profile_pic", File.join(Rails.root, '/app/assets/images/spiderman.jpeg'))
    click_button "Sign Up"
    visit "/homepage"
    fill_in "email", with: "chris@gmail.com"
    fill_in "password", with: "1234567"
    click_button "Log in" 
    visit "/posts"
    click_link "Create new post"
    fill_in "post_content", with: "Hello, world!"
    click_button "Create Post"
    click_link "Create new post"
    fill_in "post_content", with: "Hello again!"
    click_button "Create Post"
    click_link "Go to your profile"
    expect(page).to have_content "Comments Section", count: 2
  end
end
