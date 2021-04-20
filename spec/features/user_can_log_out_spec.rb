require 'rails_helper'

RSpec.feature "Logout", type: :feature do

  pending 'Can log out when logged in' do
    visit '/'
    session[:user_id] = 1

  end

end
