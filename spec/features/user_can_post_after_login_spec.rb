require 'rails_helper'

RSpec.feature 'Post after log in', type: :feature do
  scenario 'Can use post feature after logging in' do
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "Sha88"
    fill_in "Password", with: "Password88"
    click_button "Submit"
    expect(page).to have_link('New post')
  end

  scenario 'Cannot use post feature unless logged in' do
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "Sha88"
    fill_in "Password", with: "Password88"
    click_button "Submit"
    click_link "Log Out"
    expect(page).to_not have_link('New post')
  end
end
