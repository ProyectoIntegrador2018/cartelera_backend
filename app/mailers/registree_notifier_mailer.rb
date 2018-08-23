#
class RegistreeNotifierMailer < ApplicationMailer
  default from: 'no-reply@cartelerai.com'

  def send_registree_email(email, event)
    @event = event
    mail(to: email, subject: "Gracias por registrarte a #{@event.name}")
  end
end
