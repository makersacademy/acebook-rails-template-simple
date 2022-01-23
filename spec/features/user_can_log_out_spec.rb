require 'rails_helper'

RSpec.feature "Log_out", type: :feature do
  scenario "Can click 'Log Out' and session be cleared" do
    User.create(email: "example@example.com", password: "password", password_confirmation: "password")
    # Set up test database to contain user: example@example.com 
    visit "/log_in"
    fill_in "email", with: "example@example.com"
    fill_in "password", with: "password"
    click_button "Sign In"

    click_link "Log out"
    expect(page).to have_content("Welcome to Acebook")
  end
end