class VideoResults
  def create_videos(category)
    video_service = VideoService.new
    videos = video_service.get_videos(category)
    videos[:data].map { |yoga_vid| Video.new(yoga_vid) }
  end
end
