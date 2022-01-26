require 'rails_helper'

RSpec.feature "User's permissions: ", type: :feature do
  
  scenario "Cannot edit nor delete another user's posts" do
    log_out_button = '//*[@id="navbarNavDropdown"]/ul/li[3]/form/input[2]'

    sign_up_and_post(username: "user1", email: "user1@mail.com", password: "test123", post_content: "Lorem Ipsum")

    find(:xpath, log_out_button).click

    sign_up(username: "user2", email: "user2@mail.com", password: "test123")
    
    expect(page).not_to have_content "Edit"
    expect(page).not_to have_content "Delete"    
  end

  scenario "Cannot delete another user's comments on another user's post" do
    log_out_button = '//*[@id="navbarNavDropdown"]/ul/li[3]/form/input[2]'
    comment_content = '//*[@id="content"]'
    create_comment_btn = '//*[@id="create_comment"]'

    sign_up_and_post(username: "user1", email: "user1@mail.com", password: "test123", post_content: "Lorem Ipsum")
    find(:xpath, comment_content).set("Dolor sit amet")
    find(:xpath, create_comment_btn).click
    find(:xpath, log_out_button).click

    sign_up(username: "user2", email: "user2@mail.com", password: "test123")
    
    expect(page).not_to have_content "Delete"    
  end

  scenario "Can delete another user's comments on own post" do
    navbar_acebook_link = "/html/body/nav/a"
    log_out_button = '//*[@id="navbarNavDropdown"]/ul/li[3]/form/input[2]'
    comment_content = '//*[@id="content"]'
    create_comment_btn = '//*[@id="create_comment"]'
    delete_comment_btn = 'body > div.container > article > div:nth-child(2) > div:nth-child(2) > a'

    sign_up_and_post(username: "user1", email: "user1@mail.com", password: "test123", post_content: "Lorem Ipsum")
    find(:xpath, log_out_button).click

    sign_up(username: "user2", email: "user2@mail.com", password: "test123")
    find(:xpath, navbar_acebook_link).click
    find(:xpath, comment_content).set("Dolor sit amet")
    find(:xpath, create_comment_btn).click
    find(:xpath, log_out_button).click

    login(email: "user1@mail.com", password: "test123")
    find(:xpath, navbar_acebook_link).click

    expect(page).to have_content "Dolor sit amet"
    find(:css, delete_comment_btn).click
    expect(page).not_to have_content "Dolor sit amet"

    
  end

  scenario "Can only see users if logged in" do 
  visit "/users"
   expect(page).to have_content "You need to sign in or sign up before continuing"
  end 


end
