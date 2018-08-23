class ChangePublicEventName < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :public, :public_event
  end
end
