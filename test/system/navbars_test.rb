require "application_system_test_case"

class NavbarsTest < ApplicationSystemTestCase
  test "visiting the posts page" do
    visit posts_url
  
    assert_selector "nav", has_content: "posts"
  end
end
