module Helpers
  def sign_up(username:, email:, password:, confirm_password: password)
    sign_up_button = "/html/body/button[1]/a"
    sign_up_username = '//*[@id="user_username"]'
    sign_up_email = '//*[@id="user_email"]'
    sign_up_password = '//*[@id="user_password"]'
    sign_up_password_confirmation = '//*[@id="user_password_confirmation"]'
    sign_up_button_confirmation = '/html/body/form/div[5]/input'
    log_out_button = '/html/body/button/a'

    visit "/"
    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_username).set(username)
    find(:xpath, sign_up_email).set(email)
    find(:xpath, sign_up_password).set(password)
    find(:xpath, sign_up_password_confirmation).set(confirm_password)
    find(:xpath, sign_up_button_confirmation).click
  end

  def sign_up_and_post
    sign_up
  end 
  
end

