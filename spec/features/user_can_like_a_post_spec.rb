require 'rails_helper'

RSpec.feature "Like button", type: :feature do

  scenario 'multiple users can like and unlike a post' do
    post_message("Shout out to my homiiiieeees", "Cool Aunt Dodo")
    expect(page).to have_content("0 Approvals")
    like_post
    expect(page).to have_content("1 Approval")
    like_post
    expect(page).to have_content("0 Approvals")
    log_out_sign_up_and_like("Han Solo")
    expect(page).to have_content("1 Approval")
    like_post
    expect(page).to have_content("0 Approvals")
  end

  scenario 'a post can be liked mulitple times by different users' do
    post_message("Shout out to my homiiiieeees", "Cool Aunt Dodo")
    expect(page).to have_content("0 Approvals")
    like_post
    expect(page).to have_content("1 Approval")
    log_out_sign_up_and_like("Han Solo")
    expect(page).to have_content("2 Approvals")
    log_out_sign_up_and_like("Yoda")
    expect(page).to have_content("3 Approvals")
  end
end
