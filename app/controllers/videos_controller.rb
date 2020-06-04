class VideosController < ApplicationController
  before_action :require_user

  def index
    videos = current_user.suggested_videos
    params[:category] = 'yoga' if params[:category].nil?
    videos = videos.select { |video| video.category == params[:category] }
    @facade = PlaylistFacade.new(videos, params[:video_id])
    @playlist_items = @facade.videos.paginate(page: params[:page], per_page: 5)
  end
end
