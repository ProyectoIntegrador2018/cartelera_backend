#
class ApplicantSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :office, :phone_number,
             :campus, :user_type, :is_newbie, :enabled, :password
end