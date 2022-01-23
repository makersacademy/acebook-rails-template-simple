require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/"
    click_link "Sign up"
    fill_in "user[email]", with: "feature@test.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Sign-up"
    click_link "Add post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can click a post link to view individual post" do
    visit "/"
    click_link "Sign up"
    fill_in "user[email]", with: "feature@test.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Sign-up"
    click_link "Add post"
    fill_in "Message", with: "Test"
    click_button "Submit"
    click_link "Test"
    expect(page).to have_content("Test")
  end

  scenario "The posts are ordered from newest to oldest" do
    visit "/"
    click_link "Sign up"
    fill_in "user[email]", with: "feature@test.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Sign-up"
    click_link "Add post"
    fill_in "Message", with: "Test old"
    click_button "Submit"
    click_link "Add post"
    fill_in "Message", with: "Test new"
    click_button "Submit"

    expect("Test new").to appear_before("Test old")
  end

  scenario "A post can have an attached image" do
    visit "/"
    click_link "Sign up"
    fill_in "user[email]", with: "feature@test.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Sign-up"
    click_link "Add post"
    fill_in "Message", with: "This is a post message"
    attach_file("post[image]", Rails.root + "spec/features/Test_images/test.png")
    click_button "Submit"
    expect(page.find('.image')['src']).to have_content('test.png')
  end

  scenario "Post displays the users email" do
    visit "/sign_ups"
    fill_in "user[email]", with: "feature@test.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Sign-up"
    visit "/posts/new"
    fill_in "Message", with: "This is a post message"
    click_button "Submit"
    expect(page).to have_content("feature@test.com")
  end

  scenario "A post has the user who posted it avatar attached to it" do
    visit "/"
    click_link "Sign up"
    fill_in "user[email]", with: "feature@test.com"
    attach_file("user[avatar]", Rails.root + "spec/features/Test_images/Cat_2.png")
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Sign-up"
    click_link "Add post"
    fill_in "Message", with: "This is a post message"
    click_button "Submit"
    expect(page.find('.avatar')['src']).to have_content('Cat_2.png')
    
  end
  
end
