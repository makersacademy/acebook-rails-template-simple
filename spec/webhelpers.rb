def create_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end

def user_sign_up
    visit("/users/new")
    fill_in "Name", with: "Inigo"
    fill_in "Email", with: "fake@fake.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    click_button "Submit"

end