require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    post_message("Hello, world!", "test")
    expect(page).to have_content("Hello, world!")
  end
end
