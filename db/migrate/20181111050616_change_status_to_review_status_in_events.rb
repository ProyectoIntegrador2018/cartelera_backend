class ChangeStatusToReviewStatusInEvents < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :status, :review_status
  end
end
