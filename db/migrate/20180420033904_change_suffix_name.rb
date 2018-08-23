class ChangeSuffixName < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :suffix, :prefix
  end
end
