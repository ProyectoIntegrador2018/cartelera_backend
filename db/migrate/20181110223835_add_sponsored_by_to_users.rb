class AddSponsoredByToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sponsored_by, :integer, default: 0
  end
end
