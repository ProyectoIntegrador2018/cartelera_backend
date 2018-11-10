class ChangeDefaultStatusTypeToEvent < ActiveRecord::Migration[5.0]
  def change
    change_column_default :events, :status_type, 'sponsor_review'
  end
end
