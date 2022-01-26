require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can comment on posts and view changes" do
    
    navbar_acebook_link = "/html/body/nav/a"
    message_content = '//*[@id="post_message"]'
    create_post_btn = '//*[@id="submit"]'
    comment_content = '//*[@id="content"]'
    create_comment_btn = '//*[@id="create_comment"]'

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
