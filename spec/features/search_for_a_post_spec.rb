require 'rails_helper'

RSpec.feature "Search for a Post", type: :feature do
  scenario "A user can search for a post by content" do
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
    fill_in "post_content", with: "Goodbye world!"
    click_button "Create Post"
    fill_in "search_by_content", with: "hello"
    find('#search_by_content_submit').click
    expect(page).to_not have_content "Goodbye world!"
  end
  scenario "A user can search for a post by friend" do
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

    visit "/signup"
    fill_in "name", with: "Mayo"
    fill_in "email", with: "m@gmail.com"
    fill_in "password", with: "1234567"
    attach_file("profile_pic", File.join(Rails.root, '/app/assets/images/spiderman.jpeg'))
    click_button "Sign Up"
    visit "/homepage"
    fill_in "email", with: "m@gmail.com"
    fill_in "password", with: "1234567"
    click_button "Log in" 
    visit "/posts"
    click_link "Create new post"
    fill_in "post_content", with: "I love Spiderman!"
    click_button "Create Post"

    fill_in "search_by_user", with: "chris"
    find("#search_by_user_submit").click
    expect(page).to_not have_content "I love Spiderman!"
  end
end
