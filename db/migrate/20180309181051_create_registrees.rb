class CreateRegistrees < ActiveRecord::Migration[5.0]
  def change
    create_table :registrees do |t|
      t.string :user_email, null: false
      t.integer :event_id, null: false

      t.timestamps
    end
  end
end
