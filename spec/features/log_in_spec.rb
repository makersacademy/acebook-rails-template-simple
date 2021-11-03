require 'rails_helper'

RSpec.feature 'Log in', type: :feature do
  scenario 'A user can log in to their Acebook account' do
    sign_up
    click_on('Sign out')
    
    visit('/welcome')
    click_button('Login')
    expect(page).to have_current_path('/login')
    fill_in 'Username', with: 'user'
    fill_in 'Password', with: 'password'
    click_button('Login')
    expect(page).to have_current_path('/posts')
    # below line is commented as we will need to add a flash message for this
    # expect(page).to have_content('You are Logged In, user')
  end
end
