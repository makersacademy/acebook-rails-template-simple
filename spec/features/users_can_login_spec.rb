require 'rails_helper'

RSpec.feature "login", type: :feature do
  scenario "User can login" do
    sign_up("Sha88")
    click_link "Log Out"
    fill_in "Username", with: "Sha88"
    fill_in "Password", with: "password"
    click_button "LOG IN"
    expect(page).to have_content("Sha88")
  end
end
