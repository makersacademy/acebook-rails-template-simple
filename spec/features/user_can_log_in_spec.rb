require 'rails_helper'

RSpec.feature "Log_in", type: :feature do
    scenario "A registered user can login to their account" do
      User.create(email: "example@example.com", password: "password", password_confirmation: "password")
      # Set up test database to contain user: example@example.com 
      visit "/log_in"
      fill_in "email", with: "example@example.com"
      fill_in "password", with: "password"
      click_button "Sign In"
      expect(page).to have_content("Logged in as: example@example.com") # redirects to /posts page
    end

    scenario "An unregistered user will be redirected to the signup page" do
    visit "/log_in"
    fill_in "email", with: "test@fail.com"
    fill_in "password", with: "password"
    click_button "Sign In"
    expect(page).to have_content("Log In") # redirects to /signup page
    end
end
