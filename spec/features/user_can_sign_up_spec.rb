require 'rails_helper'

RSpec.feature "Sign Up Page", type: :feature do
  scenario "Can sign up" do
    visit "/signup"
    fill_in "name", with: "Chris"
    fill_in "email", with: "chris@gmail.com"
    fill_in "password", with: "1234567"
    attach_file("profile_pic", File.join(Rails.root, '/app/assets/images/spiderman.jpeg'))
    click_button "Sign Up"
    expect(page).to have_content("Thanks for signing up")
  end
end