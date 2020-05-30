require 'rails_helper'

RSpec.describe Quote, type: :model do
  describe 'class methods' do
    it '.quote_of_the_day', :vcr do
      quote = Quote.quote_of_the_day
      expect(quote.quote).to eq 'Emancipate yourself from mental slavery, none but ourselves can free our mind.'
      expect(quote.author).to eq 'Bob Marley'
    end
  end
end
