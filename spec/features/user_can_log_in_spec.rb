require 'rails_helper'

RSpec.feature "Log in", type: :feature do
  scenario "Can Log in on homepage" do
    visit "/homepage"
    fill_in "email", with: "chris@gmail.com"
    fill_in "password", with: "123"
    click_button "Log in"
    expect(page).to have_content("Welcome Chris!")
  end
end