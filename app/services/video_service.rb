class VideoService
  def get_videos(category)
    # get_json('/api/v1/videosfind_all', category)
    return unless category == 'yoga'

    stub_yoga_videos
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

  def stub_yoga_videos
    { data:
      [{ id: '7067',
         type: 'video',
         attributes: { id: 7067, video_id: 'b6IFkfSj4Jo',
                       title: '20 Minute Relaxation Yoga',
                       description: 'Relaxing and fun!',
                       tumbnail_url: 'http://thumbail_example.com',
                       category: 'yoga' } },
        { id: '7068',
          type: 'video',
          attributes: { id: 7068, video_id: 'v7AYKMP6rOE',
                        title: 'Yoga For Complete Beginners',
                        description: 'Yoga for Beginners',
                        tumbnail_url: 'http://thumbail_example.com',
                        category: 'yoga' } },
        { id: '7069',
          type: 'video',
          attributes: { id: 7069, video_id: 'hJbRpHZr_d0',
                        title: 'Yoga For Anxiety and Stress',
                        description: 'Get some direction in your life!',
                        tumbnail_url: 'http://thumbail_example.com',
                        category: 'yoga' } }] }
  end
end
