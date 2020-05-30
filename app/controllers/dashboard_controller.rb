class DashboardController < ApplicationController
  before_action :require_user

  def index
    @dashboard = UserDashboardFacade.new(current_user)
  end

  def show; end
end
