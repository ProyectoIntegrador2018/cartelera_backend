#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :office, :phone_number,
             :campus, :user_type, :is_newbie, :enabled, :sponsored_by
end
