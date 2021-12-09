require 'rails_helper'

RSpec.feature 'Post Image', type: :feature do
  scenario 'There is a New Post Image button' do
    visit '/post_images'
    expect(page).to have_content('New Post Image')
  end

  scenario 'can create a new image' do
    visit '/post_images'
    click_link 'New Post Image'
    expect(page).to have_content('New Post Image')
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'

    # we do not know how to check for an image file
    # fill_in 'post_image[image]', with: 'thisisadummystingforimg'
    click_button 'Create Post image'
    expect(page).to have_content('Post was successfully created.')
  end

  scenario 'if title is less than 5 characters. Validation will fail' do
    visit '/post_images'
    click_link 'New Post Image'
    fill_in 'post_image[title]', with: 'H'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Create Post image'
    expect(page).to have_content('Title is too short (minimum is 5 characters)')
  end

  scenario 'if content is less than 5 characters. Validation will fail' do
    visit '/post_images'
    click_link 'New Post Image'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This'
    click_button 'Create Post image'
    expect(page).to have_content(
      'Content is too short (minimum is 5 characters)',
    )
  end

  scenario 'There is a New Post Image link' do
    visit '/post_images'
    click_link 'New Post Image'
    expect(page).to have_content('New Post Image')
  end
end
