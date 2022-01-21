require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can edits posts and view them" do
    sign_up
    create_post
    click_link "Edit post"
    fill_in "Message", with: "Bye, world!"
    click_button "Submit"
    expect(page).to have_content("Bye, world!")
    expect(page).not_to have_content("Hello, world!")
  end
end