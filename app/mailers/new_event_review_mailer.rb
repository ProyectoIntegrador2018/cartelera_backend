#
class NewEventReviewMailer < ApplicationMailer
  default from: 'no-reply@cartelerai.com'

  def review_new_event(sponsor, applicant, event)
    @sponsor = sponsor
    @applicant = applicant
    @event = event
    mail(to: sponsor.email, subject: 'Nuevo evento creado para revisión')
  end
end