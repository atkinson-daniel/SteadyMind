class UserDashboardFacade < SimpleDelegator
  def quote
    Quote.quote_of_the_day
  end

  def user_mood
    mood_entry.id
  end

  def user_selected_mood
    mood_entry.mood_id
  end
end
