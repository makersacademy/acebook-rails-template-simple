require 'rails_helper'

RSpec.feature "Sign_up", type: :feature do
  scenario "Can submit sign in and be signed in" do
    visit "/sign_ups"
    fill_in "user[email]", with: "feature@test.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Sign-up"

    expect(page).to have_content("Welcome to Acebook")
  end
end