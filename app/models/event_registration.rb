#
class EventRegistration < ApplicationRecord
  validates :event_id, uniqueness: {
    message: 'Este correo ya se registro en el evento.',
    scope: [:registree_id]
  }

  belongs_to :registree, inverse_of: :event_registrations
  belongs_to :event, inverse_of: :event_registrations
end
