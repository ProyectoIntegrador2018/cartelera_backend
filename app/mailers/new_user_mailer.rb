#
class NewUserMailer < ApplicationMailer
  default from: 'no-reply@cartelerai.com'

  def send_new_user_email(email, password, user_type)
    @password = password
    @email = email
    @user_type = user_type
    mail(to: email, subject: 'Su nueva cuenta en Cartelerai')
  end
end