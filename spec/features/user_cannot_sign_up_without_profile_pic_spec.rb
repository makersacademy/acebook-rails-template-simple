require 'rails_helper'

RSpec.feature "Sign Up Page", type: :feature do
  scenario "Can sign up" do
    visit "/signup"
    fill_in "name", with: "Chris"
    fill_in "email", with: "chris@gmail.com"
    fill_in "password", with: "123456"
    #attach_file("profile_pic", File.join(Rails.root, '/app/assets/images/spiderman.jpeg'))
    attach_file("profile_pic", Rails.root + "spec/fixtures/spiderman.jpeg")
    click_button "Sign Up"
    expect(page).to_not have_content("Please add a profile picture")
  end
end