require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "Users can make a comment and delete it" do
    user_sign_up
    create_post
    log_out
    second_user_sign_up
    fill_in "comment[message]", with: "Hiya"
    click_button "Create Comment"
    click_link "Delete comment"
    expect(page).not_to have_content "Kim Hiya"
  end

  scenario "Users can make a comment and delete it from the individual post page" do
    user_sign_up
    create_post
    log_out
    second_user_sign_up
    click_link "Hello, world!"
    fill_in "comment[message]", with: "Hiya"
    click_button "Create Comment"
    click_link "Delete comment"
    expect(page).not_to have_content "Kim: Hiya"
  end

end