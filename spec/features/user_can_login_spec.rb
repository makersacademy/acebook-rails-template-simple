require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  scenario 'User can login' do
    visit '/'
    click_link "Haven't got an account? Sign up!"
    fill_in 'user[email]', with: 'user@email.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Create User'
    fill_in 'email', with: 'user@email.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content('Logged in Succesfully')
    expect(page).to have_content('user@email.com')
    expect(page).to have_button('Logout')
  end

  scenario "User can't login with incorrect details" do
    visit '/'
    click_link "Haven't got an account? Sign up!"
    fill_in 'user[email]', with: 'user@email.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Create User'
    fill_in 'email', with: 'user@email.co'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content('Login failed')
  end

  scenario "User can't access dashboard without login" do
    visit '/post_images'
    expect(page).to have_content('Must login to access content')
  end
end
