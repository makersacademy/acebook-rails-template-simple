require 'rails_helper'

RSpec.feature "SignUp", type: :feature do
  scenario "User can sign up to acebook" do
    sign_up("Sha88")
    expect(page).to have_content("Sha88")
  end
end
