def sign_up(then_login = true)
  visit "/"
  click_link "Sign up"
  fill_in "Name", with: "Rudolph"
  fill_in "Email", with: "rudolph@christmas.com"
  fill_in "Password", with: "shinynose12"
  click_button "Enter details"
  log_in if then_login
end