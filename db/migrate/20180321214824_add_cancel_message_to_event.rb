class AddCancelMessageToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :cancel_message, :text
  end
end
