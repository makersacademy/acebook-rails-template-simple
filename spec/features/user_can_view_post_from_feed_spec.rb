require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and click on the post to open its individual page" do
    create_post
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Second post"
    click_button "Submit"
    click_link "Hello, world!"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Edit post")
    expect(page).to have_content("Delete post")
    expect(page).not_to have_content("Second post")
  end
end