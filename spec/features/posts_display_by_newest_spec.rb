require 'rails_helper'
require 'web_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up

    add_new_post("1: Hello, world!")
    add_new_post("2: Yellow, world!")

    expect(page).to have_content("2: Yellow, world!" ,"1: Hello, world!")
  end
end
