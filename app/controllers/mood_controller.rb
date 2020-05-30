class MoodController < ApplicationController
  def create
    mood = UserMood.new(user: current_user, mood: Mood.find(mood_params[:id]))
    if mood.save
      flash[:success] = 'Mood entry saved!'
    else
      flash[:error] = 'There was an error!'
    end
    redirect_to dashboard_index_path
  end

  def update
    if UserMood.update(params[:id], mood_id: mood_params[:id])
      flash[:success] = 'Mood entry updated!'
    else
      flash[:error] = 'There was an error!'
    end
    redirect_to dashboard_index_path
  end

  private

  def mood_params
    params[:mood].permit(:id)
  end
end
