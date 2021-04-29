require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Shows username and photo next to post" do
    post_message("Hello, world!", "David")
    expect(first('.post-div')).to have_css("img[src*='pikachu.png']")
  end
end
