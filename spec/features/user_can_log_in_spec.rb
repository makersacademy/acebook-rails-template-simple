require 'rails_helper'

RSpec.feature "Log in", type: :feature do
  scenario "Can edits posts and view them" do
    user_sign_up
    visit("/login")
    fill_in "session[email]", with: "fake@fake.com"
    fill_in "session[password]", with: "password123"
    click_button "Log in"
    expect(page).to have_current_path("/posts")
    expect(page).to have_content("Logged in as Inigo")
  end
end