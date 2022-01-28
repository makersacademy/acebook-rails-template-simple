require 'rails_helper'

RSpec.feature "Likes", type: :feature do

    scenario "Users can see the number of likes on his/her post" do
      user_sign_up
      create_post
      find(".like-button").click
      expect(find(".likes")).to have_content "1 Like"
    end

    scenario "Users can see the number of likes on another post" do
      user_sign_up
      create_post
      find(".like-button").click
      log_out
      second_user_sign_up
      find(".like-button").click
      expect(find(".likes")).to have_content "2 Likes"
    end

end