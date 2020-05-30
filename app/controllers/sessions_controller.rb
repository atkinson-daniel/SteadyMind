class SessionsController < ApplicationController
  def index; end

  def create
    user = User.from_omniauth(auth_info)
    session[:user_id] = user.id
    redirect_to '/dashboard'
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You have been logged out!'
    redirect_to root_path
  end

  private

  def auth_info
    request.env['omniauth.auth']['extra']['raw_info']
  end
end
