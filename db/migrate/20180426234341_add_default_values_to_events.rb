class AddDefaultValuesToEvents < ActiveRecord::Migration[5.0]
  def change
    change_column_default :events, :status, 0
    change_column_default :events, :name, ""
    change_column_default :events, :location, ""
    change_column_default :events, :campus, "MTY"
    change_column_default :events, :photo, ""
    change_column_default :events, :cost, 0
    # Datetimes
    change_column_default :events, :requirements_to_register, ""
    change_column_default :events, :registration_url, ""
    # Datetime
    change_column_default :events, :schedule, ""
    change_column_default :events, :facebook_url, ""
    change_column_default :events, :twitter_url, ""
    change_column_default :events, :contact_phone, ""
    change_column_default :events, :contact_name, ""
    change_column_default :events, :contact_email, ""
    change_column_default :events, :cancel_message, ""
    change_column_default :events, :prefix, ""
    change_column_default :events, :registration_message, ""
  end
end
