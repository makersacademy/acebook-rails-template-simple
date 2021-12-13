require 'rails_helper'

RSpec.feature "Like button", type: :feature do 
  scenario "User can like post" do  
    visit "/"
    click_link "Haven't got an account? Sign up!"
    fill_in "user[email]", with: "user@email.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Create User"
    fill_in "email", with: "user@email.com"
    fill_in "password", with: "password"
    click_button "Login"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Like")
  end 

  scenario "User can unlike post" do  
    visit "/"
    click_link "Haven't got an account? Sign up!"
    fill_in "user[email]", with: "user@email.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Create User"
    fill_in "email", with: "user@email.com"
    fill_in "password", with: "password"
    click_button "Login"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_button "Like"
    expect(page).to have_content("Unlike")
  end
end 