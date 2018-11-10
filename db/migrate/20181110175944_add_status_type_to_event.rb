class AddStatusTypeToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :status_type, :string, default: 'sponsor'
  end
end
