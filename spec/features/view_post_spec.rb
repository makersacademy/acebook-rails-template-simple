require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before(:each) do
    sign_up
    add_new_post("Hello, world!")
  end

  scenario "Can submit post and navigate directly to post by post_id" do
    post_id = Post.find_by(message: 'Hello, world!').id
    visit("/posts/#{post_id}")

    expect(page).to have_content('Message: Hello, world!')
  end
  
  scenario "Can submit post and view them by clicking link" do
    click_on('Hello, world!')

    expect(page).to have_content('Message: Hello, world!')
  end
end
