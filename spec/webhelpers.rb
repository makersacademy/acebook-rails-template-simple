def create_post
  visit "/posts"
  click_link "New post"
  fill_in "post[message]", with: "Hello, world!"
  click_button "Submit"
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