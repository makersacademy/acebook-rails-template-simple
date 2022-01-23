require 'rails_helper'

RSpec.feature "Like", type: :feature do
  scenario "User can like a post" do
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
    click_button "Like"
    expect(page).to have_content("1 Like")
  end

  scenario "User can unlike a post" do
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
    click_button "Like"
    click_button "Unlike"
    expect(page).to have_content("0 Likes")
  end
end