require 'rails_helper'
require 'sign_up_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'A user can sign up to Acebook' do
    # include ActionView::Helpers
    sign_up
    expect(page).to have_current_path('/welcome')
    expect(page).to have_content('You are Logged In, user')
  end
end