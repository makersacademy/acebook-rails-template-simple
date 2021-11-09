require 'rails_helper'

describe ApplicationHelper do
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
