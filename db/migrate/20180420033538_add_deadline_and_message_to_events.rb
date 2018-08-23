class AddDeadlineAndMessageToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :has_deadline, :boolean, default: true
    add_column :events, :registration_message, :text
  end
end
