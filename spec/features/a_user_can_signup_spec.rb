require 'rails_helper'

feature 'signup' do
  # Review this test once log in is working & merged. False postive expectation. Should see log out or something
  scenario 'a user can sign up to 8book' do
    visit('/')
    fill_in('First Name', with: 'John')
    fill_in('Last Name', with: 'Wick')
    fill_in('Your Email', with: 'kissmygun@test.com')
    fill_in('Password', with: 'test')
    check('terms')
    click_button('Sign Up!')
    expect(page).to have_content('New Post') #hard coded
  end
end
