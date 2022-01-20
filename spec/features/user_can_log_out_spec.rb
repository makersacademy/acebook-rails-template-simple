require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can edits posts and view them" do
    user_sign_up
    click_link "Log out"
    expect(page).to have_current_path("/")
    expect(page).to have_content("Successfully logged out")
    # This should be the same as the navbar name display
  end
end