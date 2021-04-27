require 'rails_helper'

RSpec.feature "SignUp", type: :feature do
  scenario "User can sign up to acebook" do
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "Sha88"
    fill_in "Password", with: "Password88"
    click_button "Submit"
    expect(page).to have_content("Sha88")
  end
end
