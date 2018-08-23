class AddFullRegistrationToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :full_registration, :boolean, default: false
  end
end
