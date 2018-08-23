class AddEventIdToRegistree < ActiveRecord::Migration[5.0]
  def change
    add_column :registrees, :event_id, :integer
  end
end
