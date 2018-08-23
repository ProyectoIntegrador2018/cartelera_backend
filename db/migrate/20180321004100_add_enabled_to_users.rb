class AddEnabledToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :enabled, :boolean, null: false, :default => true
  end
end
