require 'rails_helper'

describe ApplicationHelper do
  describe '#number_of_likes' do
    it 'will return a message when no likes' do
      expect(helper.number_of_likes(0)).to eq('no likes yet')
    end
  end
end