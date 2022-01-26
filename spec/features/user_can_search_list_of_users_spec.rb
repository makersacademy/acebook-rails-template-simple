require 'rails_helper'

RSpec.feature 'list of users page', type: :feature do
  list_of_users = '//*[@id="navbarNavDropdown"]/ul/li[2]/a'
  list_of_users_input_field = '/html/body/form/input'
  list_of_users_search_btn ='/html/body/form/button'
  log_out_button = '/html/body/button/a' 

  scenario 'Can navigate to list of users' do
    sign_up(username: 'test_username', email: 'test@test.com', password: '123456', confirm_password: '123456')
    find(:xpath, list_of_users).click
    expect(page).to have_current_path("/users")
  end

  scenario 'Can search the list of users' do
    sign_up(username: 'test_username', email: 'test@test.com', password: '123456', confirm_password: '123456')
    find(:xpath, list_of_users).click
    expect(page).to have_current_path("/users")

    find(:xpath, list_of_users_input_field).set('test_username')
    find(:xpath, list_of_users_search_btn ).click
    expect(page).to have_content("test@test.com")
  end

  scenario 'display all users' do
    sign_up(username: "kenny", email: "kenny@test.com", password: "test123", confirm_password: "test123")
    find(:xpath, log_out_button).click
  
    sign_up(username: "mary", email: "mary@test.com", password: "test123", confirm_password: "test123")
    find(:xpath, log_out_button).click
    login(email: "kenny@test.com", password: "test123")

    find(:xpath, list_of_users).click
    expect(page).to have_current_path("/users")
    expect(page).to have_content("mary@test.com")
    expect(page).to have_content("kenny@test.com")
  end

end