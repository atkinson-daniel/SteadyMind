class Quote
  attr_reader :quote, :author

  def initialize(quote, author)
    @quote = quote
    @author = author
  end

  def self.quote_of_the_day
    quote = QuoteService.new.quote_of_the_day
    Quote.new(quote.first[:q], quote.first[:a])
  end

  def self.random_quote
    quote = QuoteService.new.random_quote
    Quote.new(quote.first[:q], quote.first[:a])
  end
end
