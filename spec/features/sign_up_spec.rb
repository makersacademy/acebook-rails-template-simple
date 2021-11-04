require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'A user can sign up to Acebook' do
    sign_up

    expect(page).to have_current_path('/posts')
    expect(page).to have_content('user')
    expect(page).to have_content('You\'re now signed up to Acebook!')
  end
end
