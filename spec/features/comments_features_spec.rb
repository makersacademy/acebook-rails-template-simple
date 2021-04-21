require 'rails_helper'

RSpec.feature "Post a Comment", type: :feature do
  scenario "User can comment on a post" do
    visit "/"
    post_message("This is a post.")
    # page.all('a')[0].click
    first('.comments-link').click_link 'Comments'
    # seems to work but will not work if the link order moves
    fill_in "Body", with: "This is my first comment."
    click_button "Submit"
    expect(page).to have_content("This is my first comment.")
  end
end
