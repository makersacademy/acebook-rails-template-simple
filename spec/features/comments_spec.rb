require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  before(:each) do
    sign_up
    add_new_post("Hello, world!")
  end
  
  scenario "Can create a comment" do
    post_id = Post.find_by(message: 'Hello, world!').id
    visit("/posts/#{post_id}")
    add_new_comment('this is a comment')

    expect(page).to have_content('this is a comment')
  end

  scenario"comment will have a username" do
    post_id = Post.find_by(message: 'Hello, world!').id
    visit("/posts/#{post_id}")
    add_new_comment('this is a comment')

    expect(page).to have_content('user')
  end

  scenario "Comment will have a timestamp" do
    post_id = Post.find_by(message: 'Hello, world!').id
    visit("/posts/#{post_id}")
    add_new_comment('this is a comment')

    expect(page).to have_content('Posted less than a minute ago')
  end

  scenario "page will show the number of comments" do
    post_id = Post.find_by(message: 'Hello, world!').id
    visit("/posts/#{post_id}")
    add_new_comment('this is a comment')
    add_new_comment('this is another comment')
    add_new_comment('this is a third comment')

    expect(page).to have_content('Comments (3)')
  end

  scenario "page will show the number of comments when there are no comments" do
    post_id = Post.find_by(message: 'Hello, world!').id
    visit("/posts/#{post_id}")

    expect(page).to have_content('Comments (0)')
  end
end