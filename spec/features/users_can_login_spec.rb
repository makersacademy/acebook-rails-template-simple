require 'rails_helper'

RSpec.feature "login", type: :feature do
  scenario "User can login" do
    sign_up("Gregg")
    click_link "Log Out"
    click_link "Log In"
    fill_in "Username", with: "Gregg"
    fill_in "Password", with: "password"
    click_button "Login"
    expect(page).to have_content("Gregg")
  end
end
