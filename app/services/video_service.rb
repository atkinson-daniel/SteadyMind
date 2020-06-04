class VideoService
  def get_videos
    get_json('/api/v1/videos')
    # response = if category == 'motivational'
    #              File.read('lib/mock/motivational_video.json')
    #            elsif category == 'meditation'
    #              File.read('lib/mock/meditation_video.json')
    #            else
    #              File.read('lib/mock/yoga_video.json')
    #            end
    # JSON.parse(response, symbolize_names: true)
  end

  def get_suggested_videos(mood)
    get_json("/api/v1/videos/#{mood}")
    # response = File.read(Rails.root.join('lib', 'mock', "#{mood}_videos.json"))
    # JSON.parse(response, symbolize_names: true)
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
