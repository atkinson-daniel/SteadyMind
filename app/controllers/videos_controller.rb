class VideosController < ApplicationController
  before_action :require_user

  def index
    videos = current_user.suggested_videos
    return if videos.nil?

    @facade = PlaylistFacade.new(videos, facade_params)
  end

  private

  def facade_params
    params.permit(:category, :video_id, :page)
  end
end
