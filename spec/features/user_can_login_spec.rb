require 'rails_helper'

RSpec.feature "Log in", type: :feature do
  scenario "users can log in" do
    visit "/login"
    fill_in :email, with: 'email@email.com'
    fill_in :password, with: '123456'
    click_button "Login"
    expect(page).to have_content("Logged in successfully")
    expect(page.current_path).to eq '/posts'
  end
end
