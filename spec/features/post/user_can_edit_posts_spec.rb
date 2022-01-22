require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can edits posts and view them" do
    user_sign_up
    create_post
    click_link "Edit"
    find('.edit_post').fill_in "post[message]", with: "Bye, world!" 
    click_button "Edit Post"
    expect(page).to have_content("Bye, world!")
    expect(page).not_to have_content("Hello, world!")
  end
end