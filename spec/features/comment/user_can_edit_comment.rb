require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "Users can make a comment and edit it" do
    user_sign_up
    create_post
    log_out
    second_user_sign_up
    fill_in "comment[message]", with: "Hiya"
    click_button "Reply"
    find('a.editbutton').click
    fill_in "comment[message]", with: "Updated"
    click_button "Submit"
    expect(page).to have_content("Updated")
    expect(page).not_to have_content "Hiya"
  end

  scenario "Users can make a comment and edit it from the individual post page" do
    user_sign_up
    create_post
    log_out
    second_user_sign_up
    click_link "Hello, world!"
    fill_in "comment[message]", with: "Hiya"
    click_button "Create Comment"
    click_link "Edit comment"
    fill_in "comment[message]", with: "Updated"
    click_button "Submit"
    expect(page).to have_content("Updated")
    expect(page).not_to have_content "Kim Hiya"
  end

  scenario "Users can only edit their own comment (from timeline)" do
    user_sign_up
    create_post
    fill_in "comment[message]", with: "Hiya"
    click_button "Reply"
    log_out
    second_user_sign_up
    expect(page).not_to have_content("Edit comment")
  end

  scenario "Users can only edit their own comment (from individual post page)" do
    user_sign_up
    create_post
    fill_in "comment[message]", with: "Hiya"
    click_button "Reply"
    log_out
    second_user_sign_up
    click_link "Hello, world!"
    expect(page).not_to have_content("Edit comment")
  end

  scenario "Users should see a helpful message when edit is successful" do
    user_sign_up
    create_post
    log_out
    second_user_sign_up
    fill_in "comment[message]", with: "Hiya"
    click_button "Reply"
    find('a.editbutton').click
    fill_in "comment[message]", with: "Updated"
    click_button "Submit"
    expect(page).to have_content("Comment edited")
  end

end