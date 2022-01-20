require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can edit posts and view changes" do

    post_submit_btn = '//*[@id="submit"]'

    sign_up
    click_link "Acebook"
    expect(current_path).to eq("/posts")
    find(:xpath, "/html/body/form[1]/input[3]").set('This is a post')
    find(:xpath, post_submit_btn).click
    expect(page).to have_content("This is a post")
    find(:xpath, "/html/body/button[1]/a").click
    #click_link "Edit"
    expect(current_path).to eq("/posts/1/edit")
    find(:xpath, "/html/body/form/input[4]").set('This post has been edited')
    #fill_in "Message", with: "Hello, world again"
    # click_button "Submit"
    find(:xpath, post_submit_btn).click
    expect(page).not_to have_content('This is a post')
    expect(page).to have_content("This post has been edited")
  end
end
