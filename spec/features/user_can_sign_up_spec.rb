require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can edits posts and view them" do
    user_sign_up
    expect(page).to have_current_path("/posts")
    expect(page).to have_content("Post")
    # This should be the same as the navbar name display
  end
end