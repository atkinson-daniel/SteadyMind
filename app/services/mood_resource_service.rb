class MoodResourceService
  def get_videos(mood)
    # get_json("suggestions?mood=#{mood}")
    File.read(Rails.root.join('lib', 'mock', "#{mood}_videos.json"))
  end

  private

  def get_json(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('') do |conn|
      conn.adapter Faraday.default_adapter
    end
  end
end
