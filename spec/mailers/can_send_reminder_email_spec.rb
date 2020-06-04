require 'rails_helper'

RSpec.describe UserNotifierMailer, type: :mailer do
  describe 'mails a log mood reminder' do
    before :each do
      @user = create(:user)
    end
    let(:mail) { UserNotifierMailer.send_reminder_email(@user).deliver }

    it 'renders the headers' do
      expect(mail.subject).to eq('Have you logged your mood today?')
      expect(mail.to).to eq([@user.email])
      expect(mail.from).to eq(['smtp.sendgrid.net'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('If you would like to do so, please follow the link below!')
    end
  end
end
