require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
#   scenario "Can sign up for account" do
#     visit "/"
#     click_link "Sign up"
#     fill_in "Email", with: "user@email.com"
#     fill_in "Password", with: "password"
#     fill_in "Confirm Password", with: "password"
#     click_button "Create account"
#     expect(page).to have_content("Login")
#   end

scenario "can visit sign up page" do
   visit "/sign_up"
   expect(page).to have_content("this is the sign up page")
end
end 

