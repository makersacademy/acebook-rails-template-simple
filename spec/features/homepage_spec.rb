require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
  scenario "User visits homepage" do
    visit "/"
    expect(page).to have_content("Acebook")
    expect(page).to have_content("Haven't got an account? Sign up!")
  end
end