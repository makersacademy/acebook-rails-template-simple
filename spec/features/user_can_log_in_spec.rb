require 'rails_helper'

RSpec.feature "Log in with good details", type: :feature do
  scenario "Can Log in on homepage" do
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
    expect(page).to have_content("Hi Chris")
  end
end

RSpec.feature "Log in with bad details", type: :feature do
  scenario "Can Log in on homepage" do
    visit "/signup"
    fill_in "name", with: "Chris"
    fill_in "email", with: "chris@gmail.com"
    fill_in "password", with: "123"
    click_button "Sign Up"
    visit "/homepage"
    fill_in "email", with: "wrong@gmail.com"
    fill_in "password", with: "wrongpassword"
    click_button "Log in"
    expect(page).to have_content("User not found, please try again")
  end
end