require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "There is a sign up form on page" do
    visit "/"
    click_link "Haven't got an account? Sign up!"
    fill_in "user[email]", with: "user@email.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Create User"

    expect(page).to have_content("Haven't got an account? Sign up!")
  end

scenario "can visit sign up page" do
   visit "/"
   click_link "Haven't got an account? Sign up!"
   expect(page).to have_content("Sign Up")
end
end 

