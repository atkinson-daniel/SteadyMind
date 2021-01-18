class AllResourcesController < ApplicationController
  before_action :require_user

  def index
    @facade = PlaylistFacade.new(video_results, facade_params)
  end

  private

  def video_results
    @video_results ||= VideoResults.new.create_videos
  end

  def facade_params
    params.permit(:category, :video_id, :page)
  end
end
