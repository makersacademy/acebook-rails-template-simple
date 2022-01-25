require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "Users can make a comment and delete it" do
    user_sign_up
    create_post
    fill_in "comment[message]", with: "Hiya"
    click_button "Reply"
    find('a.deleter').click
    expect(page).not_to have_content "Hiya"
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

  scenario "Users can only delete their own comment (from timeline)" do
    user_sign_up
    create_post
    fill_in "comment[message]", with: "Hiya"
    click_button "Reply"
    log_out
    second_user_sign_up
    expect(page).not_to have_css('i.fa-trash-alt')
  end

  scenario "Users can only delete their own comment (from individual post page)" do
    user_sign_up
    create_post
    fill_in "comment[message]", with: "Hiya"
    click_button "Reply"
    log_out
    second_user_sign_up
    click_link "Hello, world!"
    expect(page).not_to have_content("Delete comment")
  end

end