class VideosController < ApplicationController
  before_action :require_user

  def index
    @videos = current_user.suggested_videos
  end
end
