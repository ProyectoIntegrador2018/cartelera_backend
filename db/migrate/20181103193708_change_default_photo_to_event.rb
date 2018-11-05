class ChangeDefaultPhotoToEvent < ActiveRecord::Migration[5.0]
  def change
    change_column_default :events, :photo, from: "", to: "http://gda.itesm.mx/zonaei/content/bqsbCK0XJW/logo-iag_LCB.png"
  end
end
