class ChangeReviewStatusTypeToStringInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :review_status, :string
  end
end
