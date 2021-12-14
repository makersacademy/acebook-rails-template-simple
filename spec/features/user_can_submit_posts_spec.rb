require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    visit '/'
    click_link "Haven't got an account? Sign up!"
    fill_in 'user[email]', with: 'user@email.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Create User'
    fill_in 'email', with: 'user@email.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
    click_link 'New Post Image'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Create Post image'
    expect(page).to have_content('Post was successfully created.')
  end
end
