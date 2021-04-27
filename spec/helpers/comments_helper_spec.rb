require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CommentsHelper. For example:
#
# describe CommentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
# RSpec.describe CommentsHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

def create_three_comments
  first(".new-comment-form").fill_in "comment[body]", with: "This is my first comment."
  click_button "Comment"
  first(".new-comment-form").fill_in "comment[body]", with: "This is my Second comment."
  click_button "Comment"
  first(".new-comment-form").fill_in "comment[body]", with: "This is my Third comment."
  click_button "Comment"
end
