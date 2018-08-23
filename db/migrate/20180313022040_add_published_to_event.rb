class AddPublishedToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :published, :boolean, default: true
  end
end
