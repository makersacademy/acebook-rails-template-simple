module Helpers
  def sign_up
    visit "/"
    click_link "Sign Up"
    find(:xpath, "/html/body/form/div[1]/input").set("test@test.com")
    find(:xpath, "/html/body/form/div[2]/input").set("test123")
    find(:xpath, "/html/body/form/div[3]/input").set("test123")
    find(:xpath, "/html/body/form/div[4]/input").click
  end
end