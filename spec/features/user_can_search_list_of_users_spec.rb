# require 'rails_helper'

# RSpec.feature 'list of users page', type: :feature do
#   list_of_users = '//*[@id="navbarNavDropdown"]/ul/li[2]/a'
#   list_of_users_input_field = '/html/body/form/input'
#   list_of_users_search_btn ='/html/body/form/button'
#   log_out_btn = '//*[@id="navbarNavDropdown"]/ul/li[4]/form'

#   sign_up_button = '//*[@id="sign-up-button"]/a'
#   sign_up_username = '/html/body/form/div[1]/input' 
#   sign_up_email = '//*[@id="user_email"]'
#   sign_up_password = '//*[@id="user_password"]'
#   sign_up_password_confirmation = '//*[@id="user_password_confirmation"]'
#   sign_up_button_confirmation = '/html/body/form/div[5]/input'
#   log_out_button = '/html/body/button/a' 

#   scenario 'Can navigate to list of users' do
#     sign_up
#     find(:xpath, list_of_users).click
#     expect(page).to have_current_path("/users")
#   end

#   scenario 'Can search the list of users' do
#     sign_up
#     find(:xpath, list_of_users).click
#     expect(page).to have_current_path("/users")

#     find(:xpath, list_of_users_input_field).set('test_username')
#     find(:xpath, list_of_users_search_btn ).click
#     expect(page).to have_content("test@test.com")
#   end

#   scenario 'display all users' do
#     sign_up
#     find(:xpath, log_out_btn).click
  
#     expect(page).to have_current_path("/")

#     find(:xpath, sign_up_button).click
#     p current_path
#     find(:xpath, sign_up_username).set("kenny")
#     find(:xpath, sign_up_email).set("kenny@test.com")
#     find(:xpath, sign_up_password).set("test123")
#     find(:xpath, sign_up_password_confirmation).set("test123")
#     find(:xpath, sign_up_button_confirmation).click


#     find(:xpath, list_of_users).click
#     expect(page).to have_current_path("/users")


#     expect(page).to have_content("test@test.com")
#     expect(page).to have_content("kenny@test.com")
#   end

# end