require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and click on the post to open its individual page" do
    user_sign_up
    create_post
    click_link "Hello, world!"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Edit post")
    expect(page).to have_content("Delete post")
    expect(page).to have_button("Create Comment")
  end

  scenario "Posts should be displayed in order" do
    user_sign_up
    create_post
    visit "/posts"
    form = all("form").first
    form.fill_in "post[message]", with: "Bye, world!"
    click_button "Post"
    expect(all(".post-message").first).to have_content ("Bye, world!")
  end
end