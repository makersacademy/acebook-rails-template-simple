require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete a post" do
    user_sign_up
    create_post
  
    visit "/posts"
    click_link "Delete"
    expect(page).not_to have_content("Hello, world!")
  end

  scenario "Users can only delete a post they made themselves (from timeline)" do
    user_sign_up
    create_post
    log_out
    second_user_sign_up
    expect(page).not_to have_content("Delete")
  end

  scenario "Users can only delete a post they made themselves (from individual post page)" do
    user_sign_up
    create_post
    log_out
    second_user_sign_up
    click_link "Hello, world!"
    expect(page).not_to have_content("Delete post")
  end
end