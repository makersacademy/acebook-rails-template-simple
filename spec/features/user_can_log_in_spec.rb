require 'rails_helper'

RSpec.feature "Log in", type: :feature do
  scenario "Can edits posts and view them" do
    user_sign_up
    expect(page).to have_current_path("/posts")
    expect(page).to have_content("Inigo")
  end
end