require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    user_sign_up
    create_post
    id = (User.find_by(email: "zoe@gmail.com")).id
    click_link "New post"
    fill_in "post[message]", with: "Hello, I'm on rails!"
    fill_in "post[user_id]", with: id
    click_button "Submit"
    visit "/posts"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Hello, I'm on rails!")
  
  end

  scenario "Name of logged in user is displayed next to post" do
    user_sign_up
    create_post
    expect(page).to have_content("Inigo")
    expect(page).to have_content("Hello, world!")
  end
end
