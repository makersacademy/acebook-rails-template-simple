require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  before(:each) do
    sign_up
    add_new_post("Hello, world!")
  end

  scenario "user can view the number of likes on a post from /posts" do
    expect(page).to have_content('No likes yet')
  end

  scenario "user can view the number of likes on an individual post" do
    post_id = Post.find_by(message: 'Hello, world!').id
    visit("/posts/#{post_id}")
    expect(page).to have_content('No likes yet')
  end

  scenario "user can like a post and see the number of posts increase" do
    post_id = Post.find_by(message: 'Hello, world!').id
    visit("/posts/#{post_id}")
    click_button "Like"
    expect(page).to have_content('1 like')
  end

  scenario "user can like a post and see the number of posts increase from /posts" do
    post_id = Post.find_by(message: 'Hello, world!').id
    visit("/posts/#{post_id}")
    click_button "Like"
    visit("/posts")
    expect(page).to have_content('1 like')
  end

end