require 'rails_helper'

RSpec.feature "Log in", type: :feature do
  scenario "Can edits posts and view them" do
    user_sign_up
    visit("/login")
    fill_in "Email", with: "fake@fake.com"
    fill_in "Password", with: "password123"
    expect(page).to have_current_path("/posts")
    expect(page).to have_content("Welcome to the Sample App!")
    # This should be the same as the navbar name display
  end
end