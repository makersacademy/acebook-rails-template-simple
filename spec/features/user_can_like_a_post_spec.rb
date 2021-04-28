require 'rails_helper'

RSpec.feature "Like button", type: :feature do

  scenario 'user can like and unlike a post' do
    visit "/"
    post_message("Shout out to my homiiiieeees", "Cool Aunt Dodo")
    expect(page).to have_content("0 Likes")
    click_button "Like"
    expect(page).to have_content("1 Like")
    click_button "Like"
    expect(page).to have_content("0 Likes")
  end

  scenario 'a post can be liked mulitple times by different users' do
    visit "/"
    post_message("Shout out to my homiiiieeees", "Cool Aunt Dodo")
    expect(page).to have_content("0 Likes")
    click_button "Like"
    expect(page).to have_content("1 Like")
    click_link "Log Out"
    sign_up("Scheming Lovebug")
    click_button "Like"
    expect(page).to have_content("2 Likes")
    click_link "Log Out"
    sign_up("Smelly Bubbles")
    click_button "Like"
    expect(page).to have_content("3 Likes")
  end
end
