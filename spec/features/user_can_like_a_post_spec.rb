require 'rails_helper'

RSpec.feature "Logout", type: :feature do

  scenario 'user can like a post' do
    visit "/"
    post_message("Shout out to my homiiiieeees", "Cool Aunt Dodo")
    expect(page).to have_content("0 Likes")
    click_button "Like"
    expect(page).to have_content("1 Likes")
  end

end
