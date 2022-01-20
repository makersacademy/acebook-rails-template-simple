require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can edits posts and view them" do
    visit("/")
    click_link "Create new account"
    fill_in "Name", with: "Inigo"
    fill_in "Email", with: "fake@fake.com"
    fill_in "Password", with: "password123"
    click_button "Submit"
    expect(page).to have_current_path("/posts")
    expect(page).to have_content("Inigo")
    # This should be the same as the navbar name display
  end
end