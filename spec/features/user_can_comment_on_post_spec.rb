require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can comment on posts and view changes" do
    
    navbar_acebook_link = "/html/body/nav/a"
    message_content = '//*[@id="post_message"]'
    create_post_btn = '//*[@id="submit"]'
    edit_btn = '/html/body/button[1]/a'
    delete_btn = "/html/body/button[3]/a"
    comment_content = '/html/body/form[2]/p[1]/textarea'
    create_comment_btn = '/html/body/form[2]/p[2]/input'
  
    sign_up

    find(:xpath, navbar_acebook_link).click
    expect(page).to have_current_path("/posts")

    find(:xpath, message_content).set("a post")
    find(:xpath, create_post_btn).click
    expect(page).to have_content("a post")
  
    find(:xpath, comment_content).set("Fantastic")
    find(:xpath, create_comment_btn).click
    expect(page).to have_current_path("/posts")
    expect(page).to have_content("Fantastic")

  end
end
