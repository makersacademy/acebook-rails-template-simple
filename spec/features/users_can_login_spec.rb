require 'rails_helper'

RSpec.feature "login", type: :feature do
  scenario "User can login" do
    visit "/posts"
    click_link "Sign Up"
    fill_in "Username", with: "Sharkie81"
    fill_in "Password", with: "Sharks@reC00l"
    click_button "Submit"
    click_link "Log Out"
    click_link "Log In"
    fill_in "Username", with: "Sharkie81"
    fill_in "Password", with: "Sharks@reC00l"
    click_button "Login"
    expect(page).to have_content("Sharkie81")
  end
end
