require 'rails_helper'

RSpec.feature "Post a Comment", type: :feature do
  scenario "User can comment on a post" do
    post_message("This is a post", "SHA_JACK")
    first(".new-comment-form").fill_in "comment[body]", with: "This is my first comment."
    click_button "Comment"

    expect(page).to have_content("This is my first comment.")
  end
end

RSpec.feature "User can see comments on a front page", type: :feature do
  scenario "User can see first two comments (in reverse order)" do
    post_message("This is a post", "SHA_JACK")
    create_three_comments

    expect(page).to have_css('div.all-comments', visible: false) # tests something but what???
    expect(page).to have_content("This is my Second comment.")
    expect(page).to have_content("This is my Third comment.")
  end
end
