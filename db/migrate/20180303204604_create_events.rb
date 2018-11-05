class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :applicant_id, null: false, index: true
      t.integer :publisher_id, null: false, index: true
      t.integer :status, null: false
      t.string :name, null: false
      t.string :description
      t.string :address
      t.string :campus, null: false
      t.integer :category_id, null: false
      t.string :photo, default: 'http://gda.itesm.mx/zonaei/content/bqsbCK0XJW/logo-iag_LCB.png'
      t.decimal :cost
      t.boolean :public, default: true, null: false
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :requirements_to_register
      t.string :registration_url
      t.datetime :registration_deadline
      t.string :schedule
      t.string :facebook_url
      t.string :twitter_url
      t.string :contact_phone
      t.string :contact_name
      t.string :contact_email

      t.timestamps null: false
    end
  end
end
