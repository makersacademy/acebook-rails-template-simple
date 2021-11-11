require 'rails_helper'

RSpec.feature "Order by likes", type: :feature do
  scenario "Ordering button changes content, therefore changing sorting" do
    sign_up

    add_new_post("1: Hello, world!")
    add_new_post("2: Yellow, world!")

    click_on('1: Hello, world!')
    click_on('Like')

    visit('/posts')

    expect(page).to have_button('Sort by recent')

    click_button('Sort by recent')

    expect(page).to have_button('Sort by likes')
  end
end
