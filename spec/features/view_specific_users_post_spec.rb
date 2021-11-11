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

  scenario "Visit a specific users page, which displays their posts" do
    user_id = Post.find_by(message: 'user1: Hello, world!').user_id
    visit("/posts/#{user_id}/posts")

    expect(page).to have_content('user1: Hello, world!')
    expect(page).to_not have_content('user2: Yellow, world!')

    user_id_two = Post.find_by(message: 'user2: Yellow, world!').user_id
    visit("/posts/#{user_id_two}/posts")

    expect(page).to_not have_content('user1: Hello, world!')
    expect(page).to have_content('user2: Yellow, world!')
    end

  scenario "Can navigate to any post by clicking on their username" do
    user_id = Post.find_by(message: 'user1: Hello, world!').user_id
    username = User.find_by(id: user_id).username

    visit("/posts")
    expect(page).to have_content('user1: Hello, world!')
    expect(page).to have_content('user2: Yellow, world!')

    click_link(username)
    expect(page).to have_current_path("/posts/#{user_id}/posts")
    expect(page).to have_content('user1: Hello, world!')
    expect(page).to_not have_content('user2: Yellow, world!')
  end
end

RSpec.feature "Specific Users' Posts when there are no messages", type: :feature do
  scenario 'Message shown to indicate that no posts have been added yet' do
    sign_up
    user_id = User.all.last.id
    visit("/posts/#{user_id}/posts")
    
    expect(page).to have_content('No posts yet')
  end
end