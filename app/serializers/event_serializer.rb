#
class EventSerializer < ActiveModel::Serializer
  attributes :id, :photo, :name, :start_datetime, :location,
             :cancelled, :description, :campus, :category, :cost,
             :public_event, :end_datetime, :requirements_to_register,
             :registration_url, :registration_deadline, :schedule,
             :facebook_url, :twitter_url, :contact_phone, :contact_email,
             :contact_name, :published, :cancel_message, :languages, :prefix,
             :has_registration, :pet_friendly, :majors, :has_deadline,
             :registration_message, :tag_names, :max_capacity, :category_id,
             :registered_count

  def category
    return 'General' unless object.category
    object.category.name
  end

  def registered_count
    object.registrees.count
  end
end
