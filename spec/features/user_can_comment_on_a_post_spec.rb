require 'rails_helper'
require 'login_helper'

RSpec.feature "Commenting on a post", type: :feature do
  scenario "A user comments on a post and this is displayed in the comment section" do
    sign_up_and_log_in
    # visit "/signup"
    # fill_in "name", with: "Chris"
    # fill_in "email", with: "chris@gmail.com"
    # fill_in "password", with: "1234567"
    # attach_file("profile_pic", File.join(Rails.root, '/app/assets/images/spiderman.jpeg'))
    # click_button "Sign Up"
    # visit "/homepage"
    # fill_in "email", with: "chris@gmail.com"
    # fill_in "password", with: "1234567"
    # click_button "Log in" 
    visit "/posts"
    click_link "Create new post"
    fill_in "post_content", with: "Hello, world!"
    click_button "Create Post"
    expect(page).to have_content("Goodbye, world!")
  end
end
