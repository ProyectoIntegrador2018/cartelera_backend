class ChangeSponsorReviewerDefaultInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column_default :events, :sponsor_reviewer, 0
  end
end
