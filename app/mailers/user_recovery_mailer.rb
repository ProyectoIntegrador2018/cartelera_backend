#
class UserRecoveryMailer < ApplicationMailer
  default from: 'no-reply@cartelerai.com'

  def send_recovery_email(email, password)
    @password = password
    mail(to: email, subject: 'Recuperación de contraseña')
  end
end
