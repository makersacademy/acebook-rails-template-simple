module Helpers
  def sign_up
    sign_up_button = "/html/body/button[1]/a"
    sign_up_username = '//*[@id="user_username"]' 
    sign_up_email = '//*[@id="user_email"]'
    sign_up_password = '//*[@id="user_password"]'
    sign_up_password_confirmation = '//*[@id="user_password_confirmation"]'
    sign_up_button_confirmation = '/html/body/form/div[5]/input'
    log_out_button = '/html/body/button/a'

    visit "/"
    find(:xpath, sign_up_button).click
    find(:xpath, sign_up_username).set("test_username")
    find(:xpath, sign_up_email).set("test@test.com")
    find(:xpath, sign_up_password).set("test123")
    find(:xpath, sign_up_password_confirmation).set("test123")
    find(:xpath, sign_up_button_confirmation).click
  end
  
end

