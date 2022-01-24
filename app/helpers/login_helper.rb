module LoginHelper
  def sign_up_and_log_in
  visit "/signup"
  fill_in "name", with: "Chris"
  fill_in "email", with: "chris@gmail.com"
  fill_in "password", with: "1234567"
  attach_file("profile_pic", File.join(Rails.root, '/app/assets/images/spiderman.jpeg'))
  click_button "Sign Up"
  visit "/homepage"
  fill_in "email", with: "chris@gmail.com"
  fill_in "password", with: "1234567"
  click_button "Log in"
  end
end
