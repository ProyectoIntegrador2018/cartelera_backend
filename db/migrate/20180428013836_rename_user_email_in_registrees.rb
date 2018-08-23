class RenameUserEmailInRegistrees < ActiveRecord::Migration[5.0]
  def change
    rename_column :registrees, :user_email, :email
  end
end
