class AddFullNameToRegistrees < ActiveRecord::Migration[5.0]
  def change
    add_column :registrees, :full_name, :string, default: ""
  end
end
