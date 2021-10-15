require 'rails_helper'

feature 'Sign Up' do
  scenario "user can sign up" do
    visit ('/sign_up')
      fill_in('user[first_name]', with: 'Example')
      fill_in('user[last_name]', with: 'Example')
      fill_in('user[email]', with: 'test@example.com')
      fill_in('user[password]', with: '12345678')
        click_button('Sign Up')
          expect(page).to have_content ("Hello, welcome to your feed")
  end 
end 


