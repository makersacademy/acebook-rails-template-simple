require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete posts and view changes" do
    visit "/"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    click_link "Delete"
    expect(current_path).to eq("/")
    expect(page).not_to have_content("Hello, world!")
  end
end