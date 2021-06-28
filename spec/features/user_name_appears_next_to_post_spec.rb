require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before do
    register_and_login
  end

  scenario "Posts appear with users name next to it" do
    click_link "New post"
    fill_in "Message", with: "Test Post 1"
    click_button "Submit"

    expect(page).to have_content("Example User")
  end
end