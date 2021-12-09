require 'rails_helper'

RSpec.feature "Navbar", type: :feature do
  scenario "Navbar to not have content without login" do
    visit "/"
    @nav = find(".navbar")
    expect(@nav).to have_link("Acebook")
    expect(@nav).to_not have_link("Logout")
  end
end