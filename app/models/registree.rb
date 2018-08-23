#
class Registree < ApplicationRecord
  validates :email,
            presence: true

  validates :email, uniqueness: {
    message: 'Este correo ya fue registrado en el evento.',
    scope: [:event_id]
  }

  belongs_to :event, inverse_of: :registrees
end
