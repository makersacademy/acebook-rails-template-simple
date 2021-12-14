require 'rails_helper'
require_relative './web_helper.rb'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    sign_up
    log_in
    click_link 'New Post Image'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Create Post image'
    expect(page).to have_content('Post was successfully created.')
  end
end
