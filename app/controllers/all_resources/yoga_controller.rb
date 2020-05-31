class AllResources::YogaController < ApplicationController
  before_action :require_user

  def index
    video_results = VideoResults.new
    yoga_videos = video_results.create_videos('yoga')

    @playlist_videos = PlaylistFacade.new(yoga_videos, params[:video_id])
  end
end
