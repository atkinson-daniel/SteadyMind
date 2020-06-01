class AllResourcesController < ApplicationController
  before_action :require_user

  def index
    yoga_videos = VideoResults.new.create_videos(params[:category])
    @playlist_videos = PlaylistFacade.new(yoga_videos, params[:video_id])
  end
end
