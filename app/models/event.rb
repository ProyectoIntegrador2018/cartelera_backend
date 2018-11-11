#
class Event < ApplicationRecord
  validates :applicant_id,
            :sponsor_id,
            #:status,
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

  geocoded_by :location

  default_scope { order(start_datetime: :asc) }
  scope :published, -> { where(published: true) }
  scope :upcoming, -> { where('start_datetime >= ?', Date.today.beginning_of_day) }
  scope :past, -> { where('start_datetime < ?', Date.yesterday.end_of_day) }
  scope :campus, ->(campus) { where('campus like ?', "%#{campus}%") }
  scope :city, ->(city) { where('city like ?', "%#{city}%") }
  scope :state, ->(state) { where('state like ?', "%#{state}%") }
  scope :category, ->(category) { where('category_name like ?', "%#{category}%") }
  # scope :tags, -> (tags) { where('tag_names like ?', "%#{tags}%") }

  after_validation :geocode, if: ->(obj) { obj.location.present? && obj.location_changed? }
  after_create :update_city_state
  after_create :set_category_name

  def set_category_name
    update_attribute(:category_name, category.name)
    save
  end

  def update_city_state
    address = Geocoder.search(location).first
    update(city: address.city,
           state: address.state)
  end

  def registered_emails
    registrees.collect(&:email)
  end

  def tag_name
    tags.collect(&:name)
  end

  def approve_event
    update_attribute(:status, 'approved')
  end

  def decline_event
    update_attribute(:status, 'rejected')
  end

  def revise_event
    update_attribute(:status, 'waiting')
  end

  def save_review_comments(text)
    update_attribute(:review_comments, text)
  end

  def change_status_type(type)
    update_attribute(:status_type, type)
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
