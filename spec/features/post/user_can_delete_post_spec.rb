require 'rails_helper'
require_relative '../webhelpers.rb'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete a post" do
<<<<<<< HEAD
    sign_up
=======
    user_sign_up
>>>>>>> 6585971d224dab719f24654df55fa80576b478f2
    create_post
  
    visit "/posts"
    click_link "Delete post"
    expect(page).not_to have_content("Hello, world!")
  end

  scenario "Users can only delete a post they made themselves (from timeline)" do
    user_sign_up
    create_post
    log_out
    second_user_sign_up
    expect(page).not_to have_content("Delete post")
  end

  scenario "Users can only delete a post they made themselves (from individual post page)" do
    user_sign_up
    create_post
    log_out
    second_user_sign_up
    click_link "Hello, world!"
    expect(page).not_to have_content("Delete post")
  end
end