class DeleteEventRegistrationTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :event_registrations
  end
end
