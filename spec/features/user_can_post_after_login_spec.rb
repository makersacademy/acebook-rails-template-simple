require 'rails_helper'

RSpec.feature 'Post after log in', type: :feature do
  scenario 'Can use post feature after logging in' do
    sign_up("Sha88")
    expect(page).to have_css('#post-message')
  end

  scenario 'Cannot use post feature unless logged in' do
    sign_up("Sha88")
    click_link "Log Out"
    expect(page).to_not have_css('#post-message')
  end
end
