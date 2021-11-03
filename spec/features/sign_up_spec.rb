require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'A user can sign up to Acebook' do
    sign_up

    expect(page).to have_current_path('/posts')
    # uncomment next line when flash message has been implemented
    # expect(page).to have_content('You are Logged In, user')
  end
end
