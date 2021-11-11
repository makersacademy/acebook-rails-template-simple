require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "User should see an error if Sign Up failed" do
    visit "/sign-up"
    fill_in "user[first_name]", with: "Bilbo"
    fill_in "user[last_name]", with: "Baggins"
    fill_in "user[email]", with: "bilbo@theshire.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "pasword"
    click_button "Sign Up"
    expect(page).to have_content("Registration failed.")
  end
end
