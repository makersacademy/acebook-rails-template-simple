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
    first(:button, "Like").click
    expect(page).to have_content("1Like")
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
    first(:button, "Like").click
    expect(page).to have_content("1Like")
    first(:button, "Unlike").click
    expect(page).to have_content("0Likes")
  end 

  # scenario "Like turns to likes" do  
  #   visit "/"
  #   click_link "Haven't got an account? Sign up!"
  #   fill_in "user[email]", with: "user@email.com"
  #   fill_in "user[password]", with: "password"
  #   fill_in "user[password_confirmation]", with: "password"
  #   click_button "Create User"
  #   fill_in "email", with: "user@email.com"
  #   fill_in "password", with: "password"
  #   click_button "Login"
  #   fill_in "Message", with: "Hello, world!"
  #   click_button "Submit"
  #   first(:button, "Like").click
  #   click_button "Logout"
  #   click_link "Haven't got an account? Sign up!"
  #   fill_in "user[email]", with: "user@email.com"
  #   fill_in "user[password]", with: "password"
  #   fill_in "user[password_confirmation]", with: "password"
  #   click_button "Create User"
  #   fill_in "email", with: "user@email.com"
  #   fill_in "password", with: "password"
  #   click_button "Login"
  #   first(:button, "Like").click
  #   expect(page).to have_content("2Likes")
  # end
end 