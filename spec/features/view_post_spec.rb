require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before(:each) do
    sign_up
    add_new_post("Hello, world!")
  end

  scenario "Can submit post and navigate directly to post by post_id" do
    post_id = Post.find_by(message: 'Hello, world!').id
    visit("/posts/#{post_id}")

    expect(page).to have_content('Hello, world!')
  end
  
  scenario "Can submit post and view them by clicking link" do
    click_link('Hello, world!')

    expect(page).to have_content('Hello, world!')
    expect(page).to have_content('user')
  end

  scenario "Can submit post and view them by clicking link" do
    post_id = Post.find_by(message: 'Hello, world!').id
    click_on('Hello, world!')
    expect(page).to have_current_path("/posts/#{post_id}")
    click_on('Like')
    expect(page).to have_button('Like', disabled: true)
  end
end
