require 'rails_helper'

RSpec.feature "Logout", type: :feature do
  scenario "User can logout" do
    visit "/"
    click_link "Haven't got an account? Sign up!"
    fill_in "user[email]", with: "user@email.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Create User"
    fill_in "email", with: "user@email.com"
    fill_in "password", with: "password"
    click_button "Login"
    click_button "Logout"
    expect(page).to have_content("Logged out")
   end
end