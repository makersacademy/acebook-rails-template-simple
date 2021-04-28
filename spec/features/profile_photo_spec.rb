require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Adds user profile picture on sign up and displays profile picture on page" do
    sign_up("Goliath")
    expect(page).to have_css("img[src*='pikachu.png']")
  end
end
