require 'rails_helper'

RSpec.feature 'Navigation bar', type: :feature do
  scenario 'When not logged in, the nav bar only shows the Acebook link' do
    visit('/welcome')
    expect(page).to have_content('Acebook')
    expect(page).to_not have_content('Sign out')
  end

  scenario 'When logged in, nav bar shows the username and gives the option to sign out' do
    sign_up
    expect(page).to have_content('user')
    expect(page).to have_content('Sign out')
  end
  
  scenario 'Clicking Acebook takes signed in user to /posts' do
    sign_up
    click_on 'Acebook'
    expect(page).to have_current_path(posts_url)
  end

  scenario 'Clicking Sign out logs user out and takes user to /welcome' do
    sign_up
    click_on 'Sign out'
    expect(page).to have_current_path(welcome_url)
  end
end
