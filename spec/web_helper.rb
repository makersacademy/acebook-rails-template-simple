# This is a helper file to make code DRY when running feature tests
# `require 'web_helper'` within spec files to use these methods

def sign_up
  visit('/welcome')
  click_button('Sign up')
  expect(page).to have_current_path('/users/new')
  fill_in 'Username', with: 'user'
  fill_in 'Password', with: 'password'
  click_button('Create User')
end

def sign_up_different_user
  visit('/welcome')
  click_button('Sign up')
  expect(page).to have_current_path('/users/new')
  fill_in 'Username', with: 'user2'
  fill_in 'Password', with: 'password2'
  click_button('Create User')
end

def add_new_post(message)
  visit "/posts"
  fill_in "Message", with: message
  click_button "Submit"
end
