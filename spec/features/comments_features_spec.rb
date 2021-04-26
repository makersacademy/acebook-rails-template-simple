require 'rails_helper'

RSpec.feature "Post a Comment", type: :feature do
  scenario "User can comment on a post" do
    post_message("This is a post", "SHA_JACK")
    first(".new-comment-form").fill_in "comment[body]", with: "This is my first comment."
    click_button "Submit"
    expect(page).to have_content("This is my first comment.")
  end
end
