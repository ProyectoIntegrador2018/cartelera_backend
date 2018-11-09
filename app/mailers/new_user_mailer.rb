#
class NewUserMailer < ApplicationMailer
  default from: 'no-reply@cartelerai.com'

  def send_new_user_email(email, password, user_type)
    @password = password
    mail(to: email, subject: 'Su nueva cuenta en Cartelerai')
  end
end