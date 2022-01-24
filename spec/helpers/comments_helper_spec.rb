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
RSpec.describe CommentsHelper, type: :helper do

  it "should be able to tell if a comment is editable" do
    over_ten_minutes_ago = (Time.now - 601).to_s
    comment = Comment.new(created_at: over_ten_minutes_ago)
    expect(helper.editable?(comment)).to be false
  end
end
