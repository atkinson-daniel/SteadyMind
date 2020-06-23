class UserMoodsController < ApplicationController
  def index
    date = Date.parse(params['date'])
    user_mood = UserMood.where(created_at: date.beginning_of_day..date.end_of_day, user_id: current_user.id)
    render json: UserMoodSerializer.new(user_mood.first).serializable_hash
  end
end
