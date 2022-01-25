
RSpec.feature "Likes", type: :feature do
  describe "Like a specific post" do
    scenario "Users can unlike his/her post from the news feed" do
      user_sign_up
      create_post
      click_button "Like"
      expect(page).to have_button "Unlike"
    end

    scenario "Users can unlike a post from another user from the news feed" do
      user_sign_up
      create_post
      log_out
      second_user_sign_up
      click_button "Like"
      expect(page).to have_button "Unlike"
    end
  end

  describe "Like a specific post" do
    scenario "Users can like his/her post" do
      user_sign_up
      create_post
      click_link "Hello, world!"
      click_button "Like"
      expect(page).to have_button "Unlike"
    end

    scenario "Users can like a post from another user" do
      user_sign_up
      create_post
      log_out
      second_user_sign_up
      click_link "Hello, world!"
      click_button "Like"
      expect(page).to have_button "Unlike"
    end
  end
end