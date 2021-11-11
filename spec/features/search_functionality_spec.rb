require 'rails_helper'

RSpec.feature "Search", type: :feature do
  scenario "Redirects to the search page when a search string passed" do
    sign_up
    add_new_post('Hello world')

    fill_in :search, with: 'Hello'
    
    expect(page).to have_current_path('/')
  end
end
