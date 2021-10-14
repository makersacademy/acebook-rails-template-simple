require 'rails_helper'

feature 'Homepage' do
  scenario 'Shows user homepage leads sign up page' do
    visit('/')
    click_button "Sign up"
    expect(page).to have_content 'Signup here!'
  end

  scenario 'Shows user homepage leads login page' do
    visit('/')
    click_button "Login"
    expect(page).to have_content 'Login here!'
  end
end