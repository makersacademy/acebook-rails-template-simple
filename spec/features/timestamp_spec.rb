require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before(:each) do
    sign_up
  end

  scenario "Posts made <24 hours ago have a written timestamp" do
    visit('/posts')
    fill_in "new-post-message", with: 'This is a post'
    click_button "Post"
  
    expect(page).to have_content('Posted: less than a minute ago')
  end

end
