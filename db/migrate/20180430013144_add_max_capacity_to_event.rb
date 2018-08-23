class AddMaxCapacityToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :max_capacity, :integer, default: 0
  end
end
