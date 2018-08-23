class AddAttributesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :office, :string
    add_column :users, :phone_number, :string
    add_column :users, :campus, :string
  end
end
