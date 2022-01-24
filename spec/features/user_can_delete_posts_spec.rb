require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete posts and view changes" do

    navbar_acebook_link = "/html/body/nav/a"
    message_content = '//*[@id="post_message"]'
    create_post_btn = '//*[@id="submit"]'
    delete_posts_btn = 'body > div.container > article > div:nth-child(2) > div.card-link > a:nth-child(3)'
      
    sign_up

    find(:xpath, navbar_acebook_link).click
    expect(page).to have_current_path("/posts")

    find(:xpath, message_content).set("arbitrary text")
    find(:xpath, create_post_btn).click
    expect(page).to have_content("arbitrary text")

    find(:css, delete_posts_btn).click
    expect(page).to have_current_path("/posts")
    expect(page).not_to have_content("arbitrary text")

  end
end
