require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario 'User can submit posts from the homepage' do
    sign_up

    visit('/posts')
    fill_in "new-post-message", with: 'This is a post'
    click_button "Post"

    expect(page).to have_content("This is a post")
  end
  
  scenario "Can submit posts and view them" do
    sign_up

    add_new_post("Hello, world!")
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Nice post, friend!")
  end

end
