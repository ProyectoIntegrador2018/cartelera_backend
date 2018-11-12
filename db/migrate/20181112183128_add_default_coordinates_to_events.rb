class AddDefaultCoordinatesToEvents < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:events, :latitude, 25.651426)
    change_column_default(:events, :longitude, -100.291094)
  end
end
