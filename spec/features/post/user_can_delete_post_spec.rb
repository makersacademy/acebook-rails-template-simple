require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete a post" do
    create_post
    click_link "Delete post"
    expect(page).not_to have_content("Hello, world!")
  end
end