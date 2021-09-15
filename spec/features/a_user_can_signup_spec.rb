require 'rails_helper'

feature 'signup' do
  scenario 'a user can sign up to 8book' do
    visit('/eightbook')
    find_link('T&C').visible?
    fill_in('First Name', with: 'John')
    fill_in('Last name', with: 'Wick')
    fill_in('Email', with: 'kissmygun@test.com')
    fill_in('Password', with: 'test')
    fill_in('Confirm Password', with: 'test')
    check('T&Cs')
    click_button('Sign Up')
    expect(page).to have_content('Post')
  end
end