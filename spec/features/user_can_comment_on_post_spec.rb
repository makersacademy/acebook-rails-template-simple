require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can comment on posts and view changes" do
    visit "/"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(current_path).to eq("/posts")
    fill_in "content", with: "comment on my first post"
    click_button "create_comment"

    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("comment on my first post")
  end
end