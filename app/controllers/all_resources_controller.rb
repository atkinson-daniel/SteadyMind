class AllResourcesController < ApplicationController
  before_action :require_user

  def index
    video_results = VideoResults.new.create_videos
    params[:category] = 'yoga' if params[:category].nil?
    videos = find_all_by_category(video_results, params[:category])
    @facade = PlaylistFacade.new(videos, params[:video_id])
    @playlist_items = @facade.videos.paginate(page: params[:page], per_page: 5)
  end

  private

  def find_all_by_category(videos, category)
    videos.find_all do |video|
      video.category == category
    end
  end
end
