class ChangeFullRegistrationColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :full_registration, :is_newbie
  end
end
