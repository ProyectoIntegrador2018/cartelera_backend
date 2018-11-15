#
class EventReviewMailer < ApplicationMailer
  default from: 'no-reply@cartelerai.com'

  def sponsor_review_event(sponsor, applicant, event)
    @sponsor = sponsor
    @applicant = applicant
    @event = event
    mail(to: sponsor.email, subject: 'Cambios a evento para revisión')
  end

  def applicant_review_event(sponsor, applicant, event)
    @sponsor = sponsor
    @applicant = applicant
    @event = event
    mail(to: applicant.email, subject: 'Cambios a evento para revisión')
  end
end