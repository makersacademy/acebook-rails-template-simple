require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Posts display the username of poster" do

    # visit "/posts"
    # click_button "Sign up"
    # fill_in "Username" with: "David"
    # fill_in "Password" with: "1234"
    # click_button "Sign up"
    #
    # visit "/posts"
    # fill_in "Username" with: "David"
    # fill_in "Password" with: "1234"
    # click_button "Sign in"

    post_message("Today is Sunny!")

    expect(page).to have_content("Posted by: David")
    expect(first('.post')).to have_content('David')
  end
end
