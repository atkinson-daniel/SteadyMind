class QuoteService
  def quote_of_the_day
    get_json('today')
  end

  def random_quote
    get_json('random')
  end

  private

  def get_json(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://zenquotes.io/api/') do |conn|
      conn.adapter Faraday.default_adapter
    end
  end
end
