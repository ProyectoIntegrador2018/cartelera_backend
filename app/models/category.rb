#
class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { message: 'Categoría ya registrada con este nombre' }

  has_many :events, inverse_of: :category
end
