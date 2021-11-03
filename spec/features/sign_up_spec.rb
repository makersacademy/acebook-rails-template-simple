require 'rails_helper'
require 'sign_up_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'A user can sign up to Acebook' do
    expect.(page.sign_up).to Equal
  end
end