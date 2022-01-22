# require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete posts and view changes" do

    create_post_btn = '//*[@id="submit"]'
    edit_btn = '/html/body/button[1]/a'
    visit "/"
    click_link "Sign Up"
    find(:xpath, "/html/body/form/div[1]/input").set("test@test.com")
    find(:xpath, "/html/body/form/div[2]/input").set("test123")
    find(:xpath, "/html/body/form/div[3]/input").set("test123")
    find(:xpath, "/html/body/form/div[4]/input").click
    
    click_link "Acebook"
    expect(page).to have_current_path("/posts")

    find(:xpath, "/html/body/form[1]/input[3]").set("a post")
    find(:xpath, create_post_btn).click
    expect(page).to have_content("a post")


    click_link "Delete"
    expect(current_path).to eq("/posts")
    expect(page).not_to have_content("a post")
  end
end
