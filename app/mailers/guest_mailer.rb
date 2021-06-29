class GuestMailer < ApplicationMailer
  def invitation(email, booking)
    @booking = booking
    mail to: email, subject: 'Découvre une activité avec Randomize!'
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.guest_mailer.invitation.subject
  #
end
