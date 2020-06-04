class AllResourcesController < ApplicationController
  before_action :require_user

  def index
    video_results = VideoResults.new.create_videos
    params[:category] = 'yoga' if params[:category].nil?
    videos = find_all_by_category(video_results, params[:category])
    @playlist_videos = PlaylistFacade.new(videos, params[:video_id])
  end

  private

  def find_all_by_category(videos, category)
    videos.find_all do |video|
      video.category == category
    end
  end
end
