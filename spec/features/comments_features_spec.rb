require 'rails_helper'

RSpec.feature "Post a Comment", type: :feature do
  scenario "User can comment on a post" do
    visit "/"
    post_message("This is a post.", "Will_Jack")
    first('.comments-link').click_link 'Comments'
    click_link 'New Comment'
    fill_in "comment[body]", with: "This is my first comment."
    click_button "Submit"
    expect(page).to have_content("This is my first comment.")
  end
end
