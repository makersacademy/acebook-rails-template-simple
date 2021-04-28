require 'rails_helper'

RSpec.feature "Logout", type: :feature do

  scenario 'Can log out when logged in' do
    sign_up("Margaret")
    click_link "Log Out"
    expect(page).to have_content("Sign Up")
  end

end
