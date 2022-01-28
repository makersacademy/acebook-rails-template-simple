require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "send a friend request" do
    # we can only add friends from the main feed given there is a post
    sign_up
    create_post 
    log_out

    user_sign_up
    click_button "Add as friend"
  
    visit "/posts"
    expect(page).to_not have_content("Add as friend")
  end
end