require 'rails_helper'

describe ApplicationHelper do
  describe '#convert_date' do
    it 'converts a date' do
      expect(helper.convert_date('2021-11-08 14:57:06 UTC')).to eq('08-11-2021')
    end
  end

  describe '#lessthanaday?' do
    it 'checks if post was made <24 hours ago' do
      allow(Time).to receive(:now).and_return(Time.new(2021, 11, 9, 14, 0, 0))
      expect(helper.lessthanaday?('2021-11-09 15:08:06 UTC')).to eq(true)
    end

    it 'checks if post was made >24 hours ago' do
      allow(Time).to receive(:now).and_return(Time.new(2021, 11, 8, 15, 0, 0))
      expect(helper.lessthanaday?('2021-11-09 15:08:06 UTC')).to eq(false)
    end
  end
  



end
