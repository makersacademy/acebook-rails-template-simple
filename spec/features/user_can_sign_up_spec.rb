require 'rails_helper'

RSpec.feature "Sign Up Page", type: :feature do
  scenario "Can sign up" do
    visit "/signup"
    fill_in "Name", with: "Chris"
    fill_in "Email Address", with: "chris@gmail.com"
    fill_in "Password", with: "123"
    click_button "Sign up"
    expect(page).to have_content("Welcome to Acebook")
  end
end