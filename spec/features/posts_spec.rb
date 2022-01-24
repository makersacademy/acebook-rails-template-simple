require 'rails_helper'

RSpec.feature "Posting", type: :feature do
  before do
    sign_up
  end
  
  scenario "Can submit posts and view them" do
    visit "/posts"
    find(:xpath, '//*[@id="post_message"]').set("Hello, world!")
    find(:xpath, '//*[@id="submit-button"]/input').click
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can submit picture and text" do
    visit "/posts"
    find(:xpath, '//*[@id="post_message"]').set("Test")
    find(:xpath, '//*[@id="post_image"]').set("lib/assets/Scooby-Doo_test_picture.png")
    find(:xpath, '//*[@id="submit-button"]/input').click
    expect(page).to have_content("Test")
    expect(page).to have_css("img[src*='Scooby-Doo_test_picture.png']")  
  end

  scenario "Can submit just a picture as a posts" do
    visit "/posts"
    find(:xpath, '//*[@id="post_image"]').set("lib/assets/ShaggyRogers_test_picture.png")
    find(:xpath, '//*[@id="submit-button"]/input').click
    expect(page).to have_css("img[src*='ShaggyRogers_test_picture.png']")  
  end

  scenario "Doesn't let you post without either message or picture" do
    visit "/posts"
    find(:xpath, '//*[@id="submit-button"]/input').click
    expect(page).to_not have_button("Post needs a message or an image") 
  end 
end
