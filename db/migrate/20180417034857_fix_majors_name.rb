class FixMajorsName < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :mayors, :majors
  end
end
