require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and click on the post to open its individual page" do
    sign_up
    create_post
    click_link "Hello, world!"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Edit post")
    expect(page).to have_content("Delete post")
    expect(page).to have_button("Create Comment")
  end
end