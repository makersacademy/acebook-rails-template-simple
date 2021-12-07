require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
  scenario "User visits homepage" do
    visit "/"
    expect(page).to have_content("sign up")
  end
end