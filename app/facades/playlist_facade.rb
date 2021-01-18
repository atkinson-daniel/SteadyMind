class PlaylistFacade
  attr_reader :video_results, :params

  def initialize(video_results, params)
    @video_results = video_results
    @params = params
  end

  def current_video
    return nil if videos.nil?

    filtered_videos.find { |video| video.video_id == video_id }
  end

  def current_video_id
    params&.dig(:video_id) || filtered_videos.first.video_id
  end

  def category
    params&.dig(:category) || 'yoga'
  end

  def paginated_videos
    filtered_videos.paginate(page: page, per_page: 5)
  end

  def page
    params&.dig(:page).blank? ? 1 : params&.dig(:page)
  end

  def filtered_videos
    video_results.find_all { |video| video.category == category }
  end
end
