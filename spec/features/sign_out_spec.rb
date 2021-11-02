require 'rails_helper'

RSpec.feature 'Sign out', type: :feature do
  scenario 'A user can sign out of their Acebook account' do
    visit('/welcome')
    click_button('Sign up')
    expect(page).to have_current_path('/users/new')
    fill_in 'Username', with: 'user'
    fill_in 'Password', with: 'password'
    click_button('Create User')
    expect(page).to have_current_path('/welcome')
    expect(page).to have_content('You are Logged In, user')
    click_button('Sign out')
    expect(page).to have_current_path('/welcome')
  end
end