class AddEventIdToTag < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :event_id, :integer, null: false, index: true
  end
end
