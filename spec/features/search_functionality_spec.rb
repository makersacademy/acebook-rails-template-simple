require 'rails_helper'

RSpec.feature "Search", type: :feature do
  before(:each) do
    sign_up
    add_new_post('Hello world')
    add_new_post('Goodbye world')
  end
  
  scenario "Redirects to the search page when a search string passed" do
    fill_in :search, with: 'Hello'
    click_button "Search"
    expect(page).to have_current_path('/posts/search/Hello')
  end

  scenario "Redirects to home page when no search string passed" do
    click_button "Search"
    expect(page).to have_current_path(posts_url)
  end

  scenario "Displays posts containing the search string" do
    add_new_post('Bonjour')
    fill_in :search, with: 'world'
    click_button "Search"

    expect(page).to have_content('Hello world')
    expect(page).to have_content('Goodbye world')
    expect(page).to_not have_content('Bonjour')
  end
end
