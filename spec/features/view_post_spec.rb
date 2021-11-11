require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before(:each) do
    sign_up
    add_new_post("Hello, world!")
  end

  scenario "Can submit post and navigate directly to post by post_id" do
    navigate_to_post('Hello, world!')
    expect(page).to have_content('Hello, world!')
  end
  
  scenario "Can submit post and view them by clicking link" do
    click_link('Hello, world!')

    expect(page).to have_content('Hello, world!')
    expect(page).to have_content('user')
  end

  scenario "Number of comments can be seen on the post, 0 comments" do
    visit('/posts')
    expect(page).to have_content('No comments yet')
  end
  
  scenario "Number of comments can be seen on the post, 1 comment" do
    navigate_to_post('Hello, world!')

    add_new_comment('First comment')
    
    visit('/posts')
    expect(page).to have_content('1 comment')
  end

  scenario "Number of comments can be seen on the post, 1 comment" do
    navigate_to_post('Hello, world!')
    add_new_comment('First comment')
    navigate_to_post('Hello, world!')
    add_new_comment('Second comment')
    
    visit('/posts')
    expect(page).to have_content('2 comments')
  end
end
