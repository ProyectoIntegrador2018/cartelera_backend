class AddTagsArrayToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :tag_names, :string, array: true, default: []
  end
end
