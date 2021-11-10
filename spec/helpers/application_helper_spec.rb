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

  describe '#convert_date' do
    it 'converts a date' do
      expect(helper.convert_date('2021-11-08 14:57:06 UTC')).to eq('08-11-2021')
    end
  end

  describe '#less_than_a_day?' do
    it 'checks if post was made <24 hours ago' do
      allow(Time).to receive(:now).and_return(Time.new(2021, 11, 9, 15, 0, 0))
      expect(helper.less_than_a_day?('2021-11-09 14:08:06 UTC')).to eq(true)
    end

    it 'checks if post was made >24 hours ago' do
      allow(Time).to receive(:now).and_return(Time.new(2021, 11, 9, 15, 0, 0))
      expect(helper.less_than_a_day?('2021-11-06 15:08:06 UTC')).to eq(false)
    end
  end

  describe '#show_time' do
    it 'returns the time at which a post was made in words for posts made <24 hours ago' do
      allow(Time).to receive(:now).and_return(Time.new(2021, 11, 8, 15, 0, 0))
      expect(show_time('2021-11-08 14:00:00 UTC')).to eq('about 1 hour ago')
    end

    it 'returns the time at which a post was made in dd/mm/yyyy format for posts made >24 hours ago' do
      allow(Time).to receive(:now).and_return(Time.new(2021, 11, 8, 15, 0, 0))
      expect(show_time('2021-11-07 13:00:00 UTC')).to eq('07-11-2021')
    end
  end
end
