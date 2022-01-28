require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "see your friends list" do
    # we can only add friends from the main feed given there is a post
    sign_up
    create_post 
    log_out

    user_sign_up
    click_button "Add as friend"

    click_link "profile-link"
    expect(page).to have_content("Your Friends")
  end
end