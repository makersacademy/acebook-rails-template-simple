require 'rails_helper'

RSpec.feature 'Sign out', type: :feature do
  scenario 'A user can sign out of their Acebook account' do
    sign_up
    
    click_on('Sign out')
    expect(page).to have_current_path('/welcome')
    expect(page).to_not have_content('You are Logged In, user')
    expect(page).to have_content('You have logged out successfully!')
  end
end
