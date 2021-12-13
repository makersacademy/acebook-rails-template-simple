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

  scenario 'can create a comment' do
    visit '/post_images'
    click_link 'New Post Image'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Create Post image'
    fill_in 'comment[commenter]', with: 'Test comment'
    fill_in 'comment[body]', with: 'this is the first comment'
    click_button 'Create Comment'
    expect(page).to have_content('Commenter: Test comment')
    expect(page).to have_content('Comment: this is the first comment')
  end

  scenario 'can delete a comment' do
    visit '/post_images'
    click_link 'New Post Image'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Create Post image'
    fill_in 'comment[commenter]', with: 'Test comment'
    fill_in 'comment[body]', with: 'this is the first comment'
    click_button 'Create Comment'
    click_link 'Destroy Comment'
    expect(page).not_to have_content('Commenter: Test comment')
    expect(page).not_to have_content('Comment: this is the first comment')
  end

  scenario 'shows the number of comments on a photo' do
    visit '/post_images'
    click_link 'New Post Image'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Create Post image'
    fill_in 'comment[commenter]', with: 'Test comment'
    fill_in 'comment[body]', with: 'this is the first comment'
    click_button 'Create Comment'
    fill_in 'comment[commenter]', with: 'Test comment'
    fill_in 'comment[body]', with: 'this is the first comment'
    click_button 'Create Comment'
    click_link 'Back'
    expect(page).to have_content('Number of comments: 2')
  end

  scenario 'defaults to zero comments' do
    visit '/post_images'
    click_link 'New Post Image'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Create Post image'
    click_link 'Back'
    expect(page).to have_content('Number of comments: 0')
  end
end
