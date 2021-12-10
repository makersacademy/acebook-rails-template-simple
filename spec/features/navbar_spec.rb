require 'rails_helper'

RSpec.feature "Navbar", type: :feature do
  scenario "Navbar to not have content without login" do
    visit "/"
    @nav = find(".navbar")
    expect(@nav).to have_link("Acebook")
    expect(@nav).to_not have_button("Logout")
  end
  scenario "Navbar displays logout when user is logged in" do
    visit "/"
    @nav = find(".navbar")
    click_link "Haven't got an account? Sign up!"
    fill_in "user[email]", with: "user@email.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Create User"
    fill_in "email", with: "user@email.com"
    fill_in "password", with: "password"
    click_button "Login"
    expect(@nav).to have_button("Logout")
  end
end 