require 'rails_helper'

RSpec.feature "SignUp", type: :feature do
  scenario "User can sign up to acebook" do
    sign_up("Michael")
    expect(page).to have_content("Hello, Michael!")
  end
end
