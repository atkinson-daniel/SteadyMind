class PlaylistFacade
  attr_reader :videos, :video_id

  def initialize(videos, video_id = nil)
    @videos = videos
    @video_id = video_id
  end

  def current_video
    if @video_id
      @videos.find { |video| video.video_id == @video_id }
    elsif @videos.nil?
      nil
    else
      @videos.first
    end
  end
end
