require 'rails_helper'

RSpec.feature "Post a Comment", type: :feature do
  scenario "User can comment on a post" do
    post_message("This is a post", "SHA_JACK")
    first(".new-comment-form").fill_in "comment[body]", with: "This is my first comment."
    click_button "Submit"

    expect(page).to have_content("This is my first comment.")
  end
end

RSpec.feature "User can see comments on a front page", type: :feature do
  scenario "User can see first two comments only" do
    post_message("This is a post", "SHA_JACK")
    create_three_comments

    expect(page).to have_content("This is my first comment.")
    expect(page).to have_content("This is my Second comment.")
    expect(page).not_to have_content("This is my Third comment.")
  end

  # To make this test work I think it needs to have an additional item to see that elements have been made visible 
  # scenario "User can see all comments after pressing Unsolicited Advice" do
  #   post_message("This is a post", "SHA_JACK")
  #   create_three_comments
  #   first(".comments-button-div").click_button("Unsolicited Advice")
  #
  #   expect(page).to have_content("This is my first comment.")
  #   expect(page).to have_content("This is my Second comment.")
  #   expect(page).to have_content("This is my Third comment.")
  # end
end
