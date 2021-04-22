require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can view most recent posts first" do
    post_message("Hello, world!", "David")
    post_message("Today is Tuesday!")
    expect("Today is Tuesday!").to appear_before("Hello, world!")
  end
end
