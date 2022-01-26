require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can edit posts and view changes" do

    navbar_acebook_link = "/html/body/nav/a"
    message_content = '//*[@id="post_message"]'
    create_post_btn = '//*[@id="submit"]'
    edit_btn = 'body > div.container > article > div:nth-child(2) > div.card-link > a:nth-child(3)'

    sign_up

    find(:xpath, navbar_acebook_link).click
    expect(page).to have_current_path("/posts")

    find(:xpath, message_content).set("a post")
    find(:xpath, create_post_btn).click
    expect(page).to have_content("a post")
  
    find(:css, edit_btn).click
    find(:xpath, message_content).set("Edited this post")
    find(:xpath, create_post_btn).click
    expect(page).to have_current_path("/posts")
    expect(page).to have_content("Edited this post")
  end
end
