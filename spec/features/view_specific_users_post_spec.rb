require 'rails_helper'

RSpec.feature "Specific Users' Posts", type: :feature do
  before(:each) do
    sign_up
    add_new_post("user1: Hello, world!")
    visit('/posts')
    click_link('Sign out')

    sign_up_different_user
    visit('/posts')
    add_new_post("user2: Yellow, world!")
  end

  scenario "Can submit post and navigate directly to post by post_id" do
    user_id = Post.find_by(message: 'user1: Hello, world!').user_id
    visit("/posts/#{user_id}/posts")

    expect(page).to have_content('user1: Hello, world!')
    expect(page).to_not have_content('user2: Yellow, world!')

    user_id_two = Post.find_by(message: 'user2: Yellow, world!').user_id
    visit("/posts/#{user_id_two}/posts")

    expect(page).to_not have_content('user1: Hello, world!')
    expect(page).to have_content('user2: Yellow, world!')
  end
end
