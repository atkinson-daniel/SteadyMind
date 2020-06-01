class VideosController < ApplicationController
  before_action :require_user

  def index
    videos = current_user.suggested_videos
    @playlist_videos = PlaylistFacade.new(videos, params[:video_id])
  end
end
