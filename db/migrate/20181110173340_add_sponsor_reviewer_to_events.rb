class AddSponsorReviewerToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :sponsor_reviewer, :integer
  end
end
