module Helpers
  def sign_up
    sign_up_button = "/html/body/button[1]/a"
    sign_up_username = "/html/body/form/div[1]/input"
    sign_up_email = "/html/body/form/div[2]/input"
    sign_up_password = '/html/body/form/div[3]/input'
    sign_up_password_confirmation = '/html/body/form/div[4]/input'
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