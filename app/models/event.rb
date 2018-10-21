#
class Event < ApplicationRecord
  validates :applicant_id,
            :sponsor_id,
            :status,
            :name,
            :campus,
            :category_id,
            presence: { message: :presence }

  validates_inclusion_of :published,
                         :cancelled,
                         :public_event,
                         in: [true, false]

  belongs_to :sponsor, class_name: 'User', inverse_of: :sponsored_events
  belongs_to :applicant, class_name: 'User', inverse_of: :applied_for_events
  belongs_to :category, inverse_of: :events
  has_many :tags, inverse_of: :event
  has_many :registrees, inverse_of: :event

  geocoded_by :full_address

  default_scope { order(start_datetime: :asc) }
  scope :published, -> { where(published: true) }
  scope :upcoming, -> { where('start_datetime >= ?', Date.today.beginning_of_day) }
  scope :past, -> { where('start_datetime < ?', Date.yesterday.end_of_day) }
  scope :campus, -> (campus) { where('campus like ?', "%#{campus}%") }
  scope :city, -> (city) { where('city like ?', "%#{city}%") }
  scope :state, -> (state) { where('state like ?', "%#{state}%") }
  scope :category, -> (category) { where('category_name like ?', "%#{category}%") }
  # scope :tags, -> (tags) { where('tag_names like ?', "%#{tags}%") }

  after_validation :geocode, if: -> (obj) { obj.address.present? and obj.address_changed? }
  after_create :set_category_name

  def set_category_name
    category_name == category.name
  end

  def full_address
    [address, state, 'México'].compact.join(', ')
  end

  def registered_emails
    registrees.collect(&:email)
  end

  def tag_name
    tags.collect(&:name)
  end

  class << self
    def pages(options)
      if options[:per_page]
        pages = count / options[:per_page].to_f
        pages += 1 if pages % 1 > 0
        pages.to_i
      else
        1
      end
    end
  end
end
