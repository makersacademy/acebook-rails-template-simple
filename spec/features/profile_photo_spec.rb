require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Adds user profile picture on sign up and displays profile picture on page" do

    # visit "/"
    # click_link "Sign Up"
    # fill_in "Username", with: "david"
    # fill_in "Password", with: "password"
    # click_button "Submit"
    #
    # visit "/login"
    # fill_in "username", with: "david"
    # fill_in "password", with: "password"
    # click_button "Login"
    #
    # expect(page).to have_content("Hello, david!")
    # expect(page).to have_xpath("//img[contains(@src,'DG0921S.png')]")

    sign_up("Goliath")

    # expect(page).to have_css("src='.png'")
    expect(page).to have_css("img[src*='pikachu.png']")

  end
end
