class AddNewAttributesToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :languages, :string, array: true, default: []
    add_column :events, :suffix, :string
    add_column :events, :has_registration, :boolean, default: true
    add_column :events, :pet_friendly, :boolean, default: false
    add_column :events, :mayors, :string, array: true, default: []
  end
end
