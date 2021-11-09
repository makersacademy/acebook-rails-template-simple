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
    expect(page).to have_content('You have logged in successfully!')
  end

  scenario 'A user cannot log in with incorrect details' do
    sign_up
    click_on('Sign out')
    
    visit('/welcome')
    click_button('Login')
    expect(page).to have_current_path('/login')
    fill_in 'Username', with: 'user'
    fill_in 'Password', with: '123'
    click_button('Login')
    expect(page).to have_current_path('/login')
    expect(page).to have_content('Incorrect details - try again')
  end
end
