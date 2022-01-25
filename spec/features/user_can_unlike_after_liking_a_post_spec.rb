require 'rails_helper'

RSpec.feature "Liking a post", type: :feature do
  scenario "A user can like a post, then unlike a post" do
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
    click_button "Like"
    click_button "Unlike"
    expect(page).to have_content "0 Likes"
  end
end
