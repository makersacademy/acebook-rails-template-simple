require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  scenario "Users can make like a post from the news feed" do
    user_sign_up
    create_post
    log_out
    second_user_sign_up
    click_button "Like"
    # expect(like.count).to equal(1)
    expect(page).to have_button "Unlike"
  end

  scenario "Users can unlike a post from the news feed" do
    user_sign_up
    create_post
    log_out
    second_user_sign_up
    click_button "Like"
    click_button "Unlike"
    # expect(like.count).to equal(0)
    expect(page).to have_button "Like"
  end


  #  like count test
end