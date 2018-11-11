class ChangeReviewStatusDefaultInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column_default :events, :review_status, ''
  end
end
