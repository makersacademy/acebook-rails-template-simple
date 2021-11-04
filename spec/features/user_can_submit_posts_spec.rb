require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up

    add_new_post("Hello, world!")
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Nice post, friend!")
  end
end
