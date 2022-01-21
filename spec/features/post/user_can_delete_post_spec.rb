require 'rails_helper'
require_relative '../webhelpers.rb'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete a post" do
    sign_up
    create_post
  
    visit "/posts"
    click_link "Delete post"
    expect(page).not_to have_content("Hello, world!")
  end
end