require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can like posts and amount of likes is viewable next to the post" do 
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("0 likes")
    click_link "Like"
    expect(page).to have_content("1 likes")
  end
end