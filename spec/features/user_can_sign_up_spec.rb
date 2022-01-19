require 'rails_helper'

RSpec.feature "Sign Up Page", type: :feature do
  scenario "Can sign up" do
    visit "/signup"
    fill_in "name", with: "Chris"
    fill_in "email", with: "chris@gmail.com"
    fill_in "password", with: "123"
    click_button "Sign Up"
    expect(page).to have_content("SIGN UP COMPLETE")
  end
end