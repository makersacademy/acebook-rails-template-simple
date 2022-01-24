require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    navbar_acebook_link = "/html/body/nav/a"
    message_content = '//*[@id="post_message"]'
    create_post_btn = '//*[@id="submit"]'
       
    sign_up

    find(:xpath, navbar_acebook_link).click
    expect(page).to have_current_path("/posts")

    find(:xpath, message_content).set("a post")
    find(:xpath, create_post_btn).click
    expect(page).to have_content("a post")
  
  end
end
