require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Posts display the username of poster" do
    #
    # visit "/posts"
    # fill_in "Username" with: "David"
    # fill_in "Password" with: "1234"
    # click_button "Sign in"

    post_message("Today is Sunny!", "David")

    expect(page).to have_content("David")
    expect(first('.poster')).to have_content('David')
  end
end
