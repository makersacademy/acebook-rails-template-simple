def sign_up
  visit "/users"
  click_link "Create new account"
  fill_in "user[name]", with: "Zoe"
  fill_in "user[email]", with: "zoe@gmail.com"
  fill_in "user[password]", with: "123456"
  fill_in "user[password_confirmation]", with: "123456"
  click_button "Create User" 
end

def create_post
  id = (User.find_by(email: "zoe@gmail.com")).id
  visit "/posts"
  click_link "New post"
  fill_in "post[message]", with: "Hello, world!"
  fill_in "post[user_id]", with: id
  click_button "Submit"
  visit '/posts'
end
