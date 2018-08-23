class RemoveEventIdFromRegistree < ActiveRecord::Migration[5.0]
  def change
    remove_column :registrees, :event_id, :integer
  end
end
