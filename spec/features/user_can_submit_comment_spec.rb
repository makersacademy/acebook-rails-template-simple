require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can comment on a post and view the comment" do
    visit "/"
    click_link "Sign up"
    fill_in "user[email]", with: "feature@test.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Sign-up"
    click_link "Add post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Hello, world!"
    fill_in "comment[body]", with: "This is a comment"
    click_button "Create Comment"
    expect(page).to have_content("This is a comment")
  end

  scenario "user email is displayed next to comment" do
    visit "/"
    click_link "Sign up"
    fill_in "user[email]", with: "feature@test.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Sign-up"
    click_link "Add post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Hello, world!"
    fill_in "comment[body]", with: "This is a comment"
    click_button "Create Comment"
    expect(page).to have_content("Comment from: feature@test.com")
  end
end
