require 'rails_helper'


RSpec.feature 'Sign up page: ', type: :feature do
  sign_up_button = "/html/body/button[1]/a"
  sign_up_username = "/html/body/form/div[1]/input"
  sign_up_email = "/html/body/form/div[2]/input"
  sign_up_password = '/html/body/form/div[3]/input'
  sign_up_password_confirmation = '/html/body/form/div[4]/input'
  sign_up_button_confirmation = '/html/body/form/div[5]/input'
  log_out_button = '/html/body/button/a'
  
  before :each do
    visit '/'
  end

  scenario 'Can sign up' do
    sign_up
    expect(page).to have_content('You are signed in as test@test.com')
    expect(page).not_to have_content 'Sign up'
  end

  scenario 'Cannot sign up if password is too short' do
    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_username).set('test_username')
    find(:xpath, sign_up_email).set('test@test.com')
    find(:xpath, sign_up_password).set('12345')
    find(:xpath, sign_up_password_confirmation).set('12345')
    find(:xpath, sign_up_button_confirmation).click
    expect(page).not_to have_content('You are signed in as test@test.com')
    expect(page).to have_content('Sign up 1 error prohibited this user from being saved: Password is too short (minimum is 6 characters)')
    expect(page).to have_content 'Sign up'
  end

  scenario 'Cannot sign up if email is invalid' do
    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_username).set('test_username')
    find(:xpath, sign_up_email).set('test')
    find(:xpath, sign_up_password).set('123456')
    find(:xpath, sign_up_password_confirmation).set('123456')
    find(:xpath, sign_up_button_confirmation).click
    expect(page).not_to have_content('You are signed in as test@test.com')
    expect(page).to have_content('Sign up 1 error prohibited this user from being saved: Email is invalid')
  end

  scenario 'Cannot sign up if email is taken' do
    sign_up

    find(:xpath, log_out_button).click

    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_username).set('test_username2')
    find(:xpath, sign_up_email).set('test@test.com')
    find(:xpath, sign_up_password).set('123456')
    find(:xpath, sign_up_password_confirmation).set('123456')
    find(:xpath, sign_up_button_confirmation).click
    expect(page).to have_content('Sign up 1 error prohibited this user from being saved: Email has already been taken')
  end

  scenario "Cannot sign up if passwords don't match" do
    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_username).set('test_username')
    find(:xpath, sign_up_email).set('test@test.com')
    find(:xpath, sign_up_password).set('123456')
    find(:xpath, sign_up_password_confirmation).set('123457')
    find(:xpath, sign_up_button_confirmation).click
    expect(page).not_to have_content('You are signed in as test@test.com')
    expect(page).to have_content("Sign up 1 error prohibited this user from being saved: Password confirmation doesn't match")
  end

  scenario "Cannot sign up if email is invalid and passwords don't match" do
    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_username).set('test_username')
    find(:xpath, sign_up_email).set('test')
    find(:xpath, sign_up_password).set('123456')
    find(:xpath, sign_up_password_confirmation).set('123457')
    find(:xpath, sign_up_button_confirmation).click
    expect(page).not_to have_content('You are signed in as test@test.com')
    expect(page).to have_content('Sign up 2 errors')
  end

  scenario 'Cannot sign up if email is invalid and passwords is too short' do
    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_username).set('test_username')
    find(:xpath, sign_up_email).set('test')
    find(:xpath, sign_up_password).set('123456')
    find(:xpath, sign_up_password_confirmation).set('123457')
    find(:xpath, sign_up_button_confirmation).click
    expect(page).not_to have_content('You are signed in as test@test.com')
    expect(page).to have_content('Sign up 2 errors')
  end
end
