class SessionsController < ApplicationController
  def index
  end

  def create
    redirect_to '/dashboard'
  end
end