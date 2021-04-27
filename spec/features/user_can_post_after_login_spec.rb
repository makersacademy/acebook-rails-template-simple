require 'rails_helper'

RSpec.feature 'Post after log in', type: :feature do
  scenario 'Can use post feature after logging in' do
    sign_up("Larry")
    expect(page).to have_link('New post')
  end

  scenario 'Cannot use post feature unless logged in' do
    sign_up("Todd")
    click_link "Log Out"
    expect(page).to_not have_link('New post')
  end
end
