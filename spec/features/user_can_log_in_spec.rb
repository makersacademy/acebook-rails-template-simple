require 'rails_helper'

feature 'Login' do
  scenario "user can login" do
    visit('/')
    click_button "Login"
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: '12345678')
    expect(page).to have_content("Login here!")
    click_button('Login')
    expect(page).to have_content("Hello, welcome to your feed")
  end 
end 

