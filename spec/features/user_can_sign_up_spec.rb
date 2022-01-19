require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  sign_up_email = '//*[@id="user_email"]'
  sign_up_password = '//*[@id="user_password"]'
  sign_up_password_confirmation = '//*[@id="user_password_confirmation"]'
  sign_up_button_confirmation = "/html/body/form/div[4]/input"
  sign_up_button = "/html/body/button[1]/a"

  scenario "Can sign up" do
    visit "/"
    find(:xpath, sign_up_button).click()
    find(:xpath,sign_up_email).set("test@test.com")
    find(:xpath,sign_up_password).set("123456")
    find(:xpath,sign_up_password_confirmation).set("123456")
    find(:xpath, sign_up_button_confirmation).click()
    expect(page).to have_content("You are signed in as test@test.com")
    expect(page).not_to have_content "Sign up"
  end

  scenario "Cannot sign up if password is too short" do
  end

  scenario "Cannot sign up if email is invalid" do
    # Add a notice that says email is invalid
  end

  scenario "Cannot sign up if email is taken" do
  end

  scenario "Cannot sign up if passwords don't match" do
  end



end


