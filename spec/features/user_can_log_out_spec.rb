require 'rails_helper'

RSpec.feature "Logout", type: :feature do

  scenario 'Can log out when logged in' do
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "Sha88"
    fill_in "Password", with: "Password88"
    click_button "Submit"
    click_link "Log Out"
    expect(page).to have_content("Sign Up")
  end

end
