class SessionsController < ApplicationController
  def index; end

  def create
    user = User.from_omniauth(auth_info)
    session[:user_id] = user.id
    redirect_to '/dashboard'
  end

  def destroy
    session.delete(:user_id)
    @quote = Quote.random_quote
    flash[:notice] = 'You have been logged out!'
    render 'welcome/index'
  end

  private

  def auth_info
    request.env['omniauth.auth']['extra']['raw_info']
  end
end
