class RemindersController < ApplicationController
  def create
    UserNotifierMailer.send_reminder_email(@user).deliver
  end
end
