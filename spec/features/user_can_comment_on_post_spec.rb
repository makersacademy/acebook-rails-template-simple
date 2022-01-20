# require 'rails_helper'


# RSpec.feature "Timeline", type: :feature do
#   scenario "Can comment on posts and view changes" do
#     # post_message_box = '//*[@id="post_message"]'
#     # comment_box = '//*[@id="content"]'
#     post_submit_btn = '//*[@id="submit"]'
#     comment_create_btn = '//*[@id="comment_create"]'
#     sign_up
#     click_link "Acebook"
#     expect(current_path).to eq("/posts")

#     find(:xpath, "/html/body/form[1]/input[3]").set('this is a post')
#     #click_button "Submit"
#     find(:xpath, post_submit_btn).click
#     expect(page).to have_content("this is a post")
#     expect(current_path).to eq("/posts")
#     find(:xpath, "/html/body/form[2]/p[1]/textarea").set('comment on my first post')
#     #fill_in "content", with: "comment on my first post"
#     find(:xpath, "/html/body/form[2]/p[2]/input").click

#     expect(page).to have_content("Hello, world!")
#     expect(page).to have_content("comment on my first post")
#   end
# end

