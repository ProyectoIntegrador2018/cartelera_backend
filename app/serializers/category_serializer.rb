#
class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :enabled, :total_count, :past_count, :upcoming_count

  def total_count
    object.events.count
  end

  def upcoming_count
    object.events.upcoming.count
  end

  def past_count
    object.events.past.count
  end
end
