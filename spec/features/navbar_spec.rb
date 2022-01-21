require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  context "logged in" do
    scenario "Can see log out button" do
      visit "/"
      click_link "Sign Up"
      find(:xpath, "/html/body/form/div[1]/input").set("test@test.com")
      find(:xpath, "/html/body/form/div[2]/input").set("test123")
      find(:xpath, "/html/body/form/div[3]/input").set("test123")
      find(:xpath, "/html/body/form/div[4]/input").click
      expect(page).to have_content("Log out")
    end

    scenario "Can see settings" do
      visit "/"
      click_link "Sign Up"
      find(:xpath, "/html/body/form/div[1]/input").set("test@test.com")
      find(:xpath, "/html/body/form/div[2]/input").set("test123")
      find(:xpath, "/html/body/form/div[3]/input").set("test123")
      find(:xpath, "/html/body/form/div[4]/input").click
      click_link "Settings"
      expect(page).to have_current_path("/users/edit")
    end

    scenario "Acebook home button takes you to posts" do
      visit "/"
      click_link "Sign Up"
      find(:xpath, "/html/body/form/div[1]/input").set("test@test.com")
      find(:xpath, "/html/body/form/div[2]/input").set("test123")
      find(:xpath, "/html/body/form/div[3]/input").set("test123")
      find(:xpath, "/html/body/form/div[4]/input").click
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
