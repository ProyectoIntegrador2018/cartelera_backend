class CreateEventRegistration < ActiveRecord::Migration[5.0]
  def change
    create_table :event_registrations do |t|
      t.integer :event_id, null: false, index: true
      t.integer :registree_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
