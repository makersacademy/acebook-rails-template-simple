require 'rails_helper'

feature 'signup' do
  scenario 'a user can sign up to 8book' do
    visit('/')
    find_link("T&C's").visible?
    fill_in('First Name', with: 'John')
    fill_in('Last Name', with: 'Wick')
    fill_in('Your Email', with: 'kissmygun@test.com')
    fill_in('Password', with: 'test')
    expect(page).to have_content("I accept the T&C's")
    click_button('Sign Up!')
    expect(page).to have_content('New post') #hard coded
  end
end