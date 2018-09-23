class AddCityAndStateToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :city, :string
    add_column :events, :state, :string
  end
end
