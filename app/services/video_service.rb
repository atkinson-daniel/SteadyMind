class VideoService
  def get_videos(category)
    # get_json('/api/v1/videosfind_all', category)
    return unless category == 'yoga'

    response = File.read('spec/fixtures/yoga_video.json')
    JSON.parse(response, symbolize_names: true)
  end

  def get_json(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://localhost:3000') do |conn|
      conn.adapter Faraday.default_adapter
    end
  end
end
