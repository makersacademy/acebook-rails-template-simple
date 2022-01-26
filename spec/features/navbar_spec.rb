require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  context "logged in" do
    scenario "Can see log out button" do
      sign_up
      expect(page).to have_content("Log out")
    end

    scenario "Can see settings" do
      sign_up
      click_link "Settings"
      expect(page).to have_current_path("/users/edit")
    end

    scenario "Acebook home button takes you to posts" do
      sign_up
      click_link "Acebook"
      expect(page).to have_current_path("/posts")
    end
  end

  context "logged out" do
    scenario "Can not see log out button" do
      visit "/"
      expect(page).to_not have_content("Log out")
    end

    scenario "Acebook home button takes you to main sign up/login page" do
      visit "/"
      click_link "Sign Up"
      click_link "Acebook"
      click_link "Log In"
      click_link "Acebook"
      expect(page).to have_current_path("/")
    end
    
    scenario "Can't see settings" do
      visit "/"
      expect(page).to_not have_content("Settings")
    end

  end
end
