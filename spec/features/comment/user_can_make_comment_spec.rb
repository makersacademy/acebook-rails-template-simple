require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "Users can make a comment from the timeline and their name will appear next to it" do
    user_sign_up
    create_post
    log_out
    second_user_sign_up
    fill_in "comment[message]", with: "Hiya"
    click_button "Reply"
    expect(page).to have_content "Kim"
    expect(page).to have_content "Hiya"
  end

  scenario "Users can make a comment on an individual post page and their name will appear next to it" do
    user_sign_up
    create_post
    log_out
    second_user_sign_up
    click_link "Hello, world!"
    fill_in "comment[message]", with: "Hiya"
    click_button "Create Comment"
    expect(page).to have_content "Kim: Hiya"
  end
end