class RenameLocationToAddress < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :location, :address
  end
end
