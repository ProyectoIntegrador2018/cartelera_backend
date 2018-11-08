class ChangeAddressToLocationInEvents < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :address, :location
  end
end
