require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe "#show_comments_with_correct_ordinal" do
    it "returns '1 comment' when passed 1" do
      expect(show_comments_with_correct_ordinal(1)).to eq('1 comment')
    end

    it "returns 'No comments yet' when passed 0" do
      expect(show_comments_with_correct_ordinal(0)).to eq('No comments yet')
    end

    it "returns the number of comments when passed a number of comments > 1" do
      expect(show_comments_with_correct_ordinal(3)).to eq('3 comments')
    end
  end
end
