require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can sign up" do
    visit "/"
    sign_up_button = "/html/body/button[1]/a"
    find(:xpath, sign_up_button).click()

    sign_up_email = '//*[@id="user_email"]'
    sign_up_password = '//*[@id="user_password"]'
    sign_up_password_confirmation = '//*[@id="user_password_confirmation"]'
    sign_up_button_confirmation = "/html/body/form/div[4]/input"

    find(:xpath,sign_up_email).set("test@test.com")
    find(:xpath,sign_up_password).set("123456")
    find(:xpath,sign_up_password_confirmation).set("123456")
    find(:xpath, sign_up_button_confirmation).click()
    expect(page).to have_content("You are signed in as test@test.com")
    expect(page).not_to have_content "Sign up"
  end
end

# email = //*[@id="user_email"]

# password = //*[@id="user_password"]

# password_confirm = //*[@id="user_password_confirmation"]

# sign_up_button_last = /html/body/form/div[4]/input


