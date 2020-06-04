class VideoResults
  def create_videos
    response = VideoService.new.all_videos
    parse_video_info(response)
  end

  def get_suggested_videos(mood)
    response = VideoService.new.get_suggested_videos(mood)
    parse_video_info(response)
  end

  private

  def parse_video_info(response)
    response[:data].map do |key|
      info = { video_id: key[:attributes][:video_id],
               category: key[:attributes][:category],
               title: key[:attributes][:title] }
      Video.new(info)
    end
  end
end
