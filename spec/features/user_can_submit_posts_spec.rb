require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    
    post_submit_btn = '//*[@id="submit"]'

    sign_up
    click_link "Acebook"
    expect(current_path).to eq("/posts")
    find(:xpath, "/html/body/form[1]/input[3]").set('This is a post')
    find(:xpath, post_submit_btn).click
    expect(page).to have_content("This is a post")
  end
end

#     find(:xpath, "/html/body/form[1]/input[3]").set('this is a post')


