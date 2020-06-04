class UserNotifierMailer < ApplicationMailer
  default :from => 'smtp.sendgrid.net'

  def send_reminder_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Have you logged your mood today?' )
  end
end
