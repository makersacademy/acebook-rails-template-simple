require 'rails_helper'

feature "Likes" do
  before :each do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
  end

  scenario "Can like a post and see the count increase" do
    visit "/posts"
    click_button"Like"
    expect(page).to have_content("Likes: 1")
  end

  scenario "Can only like a post once" do
    visit "/posts"
    click_button"Like"
    click_button"Like"
    expect(page).to have_content("Likes: 1")
  end
end