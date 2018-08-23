class AddEnabledToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :enabled, :boolean, null: false, :default => true
  end
end
