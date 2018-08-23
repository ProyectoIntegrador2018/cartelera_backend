class ChangePublisherIdToSponsorId < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :publisher_id, :sponsor_id
  end
end
