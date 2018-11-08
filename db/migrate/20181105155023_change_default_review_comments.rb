class ChangeDefaultReviewComments < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :review_comments, :text
  end
end
