def sign_up
  visit("/users/new")
  fill_in "user[name]", with: "Zoe"
  fill_in "user[email]", with: "zoe@gmail.com"
  fill_in "user[password]", with: "123456"
  fill_in "user[password_confirmation]", with: "123456"
  click_button "Create User" 
end

def create_post
  visit "/posts"
  fill_in "post[message]", with: "Hello, world!"
  click_button "Post"
end

def user_sign_up
    visit("/users/new")
    fill_in "user[name]", with: "Inigo"
    fill_in "user[email]", with: "fake@fake.com"
    fill_in "user[password]", with: "password123"
    fill_in "user[password_confirmation]", with: "password123"
    click_button "Create User"
end

def log_out
  click_link "Log out"
end

def second_user_sign_up
  visit("/users/new")
  fill_in "user[name]", with: "Kim"
  fill_in "user[email]", with: "kim@fake.com"
  fill_in "user[password]", with: "password123"
  fill_in "user[password_confirmation]", with: "password123"
  click_button "Create User"
end

def user_log_in
  visit("/")
  fill_in "session[email]", with: "fake@fake.com"
  fill_in "session[password]", with: "password123"
  click_button "Log In"
end

def third_user_sign_up
  visit("/users/new")
  fill_in "user[name]", with: "Sarah"
  fill_in "user[email]", with: "sarah@fake.com"
  fill_in "user[password]", with: "blahblah1"
  fill_in "user[password_confirmation]", with: "blahblah1"
  click_button "Create User"
end

def fourth_user_sign_up
  visit("/users/new")
  fill_in "user[name]", with: "Evie"
  fill_in "user[email]", with: "evie@fake.com"
  fill_in "user[password]", with: "blahblah2"
  fill_in "user[password_confirmation]", with: "blahblah2"
  click_button "Create User"
end