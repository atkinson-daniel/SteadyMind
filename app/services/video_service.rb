class VideoService
  def all_videos
    get_json('/api/v1/videos')
  end

  def get_suggested_videos(mood)
    get_json("/api/v1/videos/#{mood}")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(ENV['MICROSERVICE_DOMAIN']) do |conn|
      conn.adapter Faraday.default_adapter
    end
  end
end
