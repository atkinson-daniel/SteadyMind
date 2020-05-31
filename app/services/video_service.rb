class VideoService
  def get_videos(category)
    # get_json('/api/v1/videosfind_all', category)
    response = if category == 'motivational'
                 File.read('app/mock/motivational_video.json')
               elsif category == 'meditation'
                 File.read('app/mock/meditation_video.json')
               else
                 File.read('app/mock/yoga_video.json')
               end
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
