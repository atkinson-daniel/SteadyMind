class DashboardController < ApplicationController
  before_action :require_user

  def index
    @quote = Quote.quote_of_the_day if current_user.logged_mood?
  end

  def show; end
end
