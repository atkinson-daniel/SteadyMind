require 'rails_helper'

describe QuoteService do
  context "instance methods" do
    context "#quote_of_the_day" do
      it "returns quote of the day", :vcr do
        quote = QuoteService.new.quote_of_the_day
        expect(quote).to be_an Array
        quote_data = quote.first

        expect(quote_data).to have_key :q
        expect(quote_data).to have_key :a
      end
    end
  end
end
