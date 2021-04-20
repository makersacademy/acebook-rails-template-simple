require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can view most recent posts first" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Today is Tuesday!"
    click_button "Submit"


    expect("Today is Tuesday!").to appear_before("Hello, world!")
  end
end
