require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up
    visit "/posts"
    find(:xpath, '//*[@id="post_message"]').set("Hello, world!")
    find(:xpath, "/html/body/form[1]/div/input").click
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can submit picture and text" do
    sign_up
    visit "/posts"
    find(:xpath, "/html/body/form[1]/input[4]").set("lib/assets/Scooby-Doo_test_picture.png")
    find(:xpath, "/html/body/form[1]/input[3]").set("Test")
    find(:xpath, "/html/body/form[1]/div/input").click
    expect(page).to have_content("Test")
  end

  scenario "Can submit just a picture as a posts" do
    sign_up
    visit "/posts"
    find(:xpath, "/html/body/form[1]/input[4]").set("lib/assets/Scooby-Doo_test_picture.png")
    find(:xpath, "/html/body/form[1]/div/input").click
    expect(page).to 
  end

end
