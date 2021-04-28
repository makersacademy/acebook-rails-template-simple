require 'rails_helper'

RSpec.feature "Logout", type: :feature do

  scenario 'Can log out when logged in' do
    visit "/"
    click_link "Sign Up"
    fill_in "user_username", with: "Sha88"
    fill_in "user_password", with: "Password88"
    click_button "user-signup-submit"
    click_link "Log Out"
    expect(page).to have_content("Sign Up")
  end

end
