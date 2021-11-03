require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit('/welcome')
    click_button('Sign up')
    expect(page).to have_current_path('/users/new')
    fill_in 'Username', with: 'user'
    fill_in 'Password', with: 'password'
    click_button('Create User')
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
