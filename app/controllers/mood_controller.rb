class MoodController < ApplicationController
  before_action :require_user

  def create
    mood = Mood.find_by(id: mood_params[:id])
    usermood = UserMood.new(user: current_user, mood: mood)
    usermood.save ? success : error
    redirect_to dashboard_index_path
  end

  def update
    success if UserMood.update(params[:id], mood_id: mood_params[:id])
    redirect_to dashboard_index_path
  end

  private

  def mood_params
    params[:mood].permit(:id)
  end

  def success
    flash[:success] = 'Mood entry saved!'
  end

  def error
    flash[:error] = 'There was an error!'
  end
end
