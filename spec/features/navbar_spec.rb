require 'rails_helper'
require_relative './web_helper.rb'

RSpec.feature "Navbar", type: :feature do
  scenario "Navbar to not have content without login" do
    visit "/"
    @nav = find(".navbar")
    expect(@nav).to have_link("Acebook")
    expect(@nav).to_not have_button("Logout")
  end
  scenario "Navbar displays logout when user is logged in" do
    sign_up
    log_in
    @nav = find(".navbar")
    expect(page).to have_content("Logged in Succesfully")
    expect(@nav).to have_button("Logout")
  end
end 