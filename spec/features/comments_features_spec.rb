require 'rails_helper'

RSpec.feature "Post a Comment", type: :feature do
  scenario "User can comment on a post" do
    visit "/"
    post_message("This is a post.", "Will_Jack")
    first('.comments-link').click_link 'Comments'
    fill_in "Body", with: "This is my first comment."
    click_button "Submit"
    expect(page).to have_content("This is my first comment.")
  end
end
