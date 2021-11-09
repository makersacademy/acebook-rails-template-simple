require 'rails_helper'

RSpec.feature "Image", type: :feature do
  scenario 'user can upload an image' do
    sign_up

    visit('/posts')
    fill_in "new-post-message", with: 'This is a post'
    attach_file("post[image]", Rails.root + "spec/fixtures/puppy-dog-adoption-finder-cute-websites-featured.jpeg")
    click_button "Post"

    expect(page).to have_css("img[src*='puppy-dog-adoption-finder-cute-websites-featured.jpeg']")
  end
end
