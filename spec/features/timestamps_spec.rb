require_relative "../web_helpers.rb"

feature "Timestamps" do
  scenario "A post can have a time posted" do
    sign_up
    login
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
  
    expect(page).to have_content "#{Time.now.strftime(" at %H:pm %A")}"
  end
end


