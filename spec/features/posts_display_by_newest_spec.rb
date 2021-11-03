require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit('/welcome')
    click_button('Sign up')
    expect(page).to have_current_path('/users/new')
    fill_in 'Username', with: 'user'
    fill_in 'Password', with: 'password'
    click_button('Create User')
    expect(page).to have_current_path('/welcome')
    expect(page).to have_content('You are Logged In, user')

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "1: Hello, world!"
    click_button "Submit"

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "2: Yellow, world!"
    click_button "Submit"

    expect(page).to have_content("2: Yellow, world!" ,"1: Hello, world!")
  end
end
