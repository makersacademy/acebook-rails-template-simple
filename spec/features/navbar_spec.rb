require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "if logged in, can see log out button" do
    visit "/"
    click_link "Sign Up"
    find(:xpath, "/html/body/form/div[1]/input").set("test@test.com")
    find(:xpath, "/html/body/form/div[2]/input").set("test123")
    find(:xpath, "/html/body/form/div[3]/input").set("test123")
    find(:xpath, "/html/body/form/div[4]/input").click
    expect(page).to have_content("Log out")
  end

  scenario "if logged out, can not see log out button" do
    visit "/"
    expect(page).to_not have_content("Log out")
  end

  scenario "if logged out, can not see log out button" do
    visit "/"
    click_link "Sign Up"
    find(:xpath, "/html/body/form/div[1]/input").set("test@test.com")
    find(:xpath, "/html/body/form/div[2]/input").set("test123")
    find(:xpath, "/html/body/form/div[3]/input").set("test123")
    find(:xpath, "/html/body/form/div[4]/input").click
    click_link "Home"
    expect(page).to have_current_path("/posts")
  end
end
