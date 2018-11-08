#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sponsored_events,
           class_name: 'Event',
           foreign_key: :sponsor_id,
           inverse_of: :sponsor
  has_many :applied_for_events,
           class_name: 'Event',
           foreign_key: :applicant_id,
           inverse_of: :applicant

  enum user_type: %i[admin sponsor applicant]

  scope :sponsors, -> { where(user_type: 'sponsor') }
  scope :admins, -> { where(user_type: 'admin') }
  scope :applicant, -> { where(user_type: 'applicant') }
end
