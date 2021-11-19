require 'rails_helper'

describe ApplicationHelper do
  describe "helper methods" do
    it "id2name returns name" do
      expect(helper.id2name(1)).to eq("Test  User")
    end
  end
end
