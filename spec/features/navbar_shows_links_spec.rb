require 'rails_helper'

RSpec.feature "Navbar", type: :feature do
  scenario "shows links on the posts page" do
    visit "/posts"
    expect(page).to have_css("nav a", :text => "Posts")
    expect(page).to have_css("nav a", :text => "New Post")
    expect(page).to have_css("nav a", :text => "Log Out")
  end

  scenario "persists across routes" do
    visit "/posts"
    click_link("New Post")
    expect(page).to have_css("nav a", :text => "Posts")
    expect(page).to have_css("nav a", :text => "New Post")
    expect(page).to have_css("nav a", :text => "Log Out")
  end
end
