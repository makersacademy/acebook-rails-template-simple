require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can edits posts and view them" do
    visit("/users")
    click_link "Create new account"
    fill_in "user[name]", with: "Zoe"
    fill_in "user[email]", with: "zoe@gmail.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button "Create User"
    expect(page).to have_current_path("/posts")
    expect(page).to have_content("New post")
    # This should be the same as the navbar name display
  end
end