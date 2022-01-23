require 'rails_helper'

RSpec.feature "Sign_up", type: :feature do
  scenario "Can submit sign in and be signed in" do
    visit "/"
    click_link "Sign up"
    fill_in "user[email]", with: "feature@test.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Sign-up"

    expect(page).to have_content("Logged in as: feature@test.com")
  end

  scenario "Can submit sign in and be signed in with an avatar" do
    visit "/"
    click_link "Sign up"
    fill_in "user[email]", with: "feature@test.com"
    attach_file("user[avatar]", Rails.root + "spec/features/Test_images/Cat_2.png")
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Sign-up"

    expect(page).to have_content("Logged in as: feature@test.com")
    expect(page.find('.avatar')['src']).to have_content('Cat_2.png')
  end


end