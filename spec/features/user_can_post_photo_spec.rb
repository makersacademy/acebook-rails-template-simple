require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do

  scenario 'Can post a photo' do
    sign_up("Mary")
    post_photo()
    expect(page).to have_css("img[src*='granny-with-guns.jpeg']")
  end

end
