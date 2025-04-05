class Property < ApplicationRecord
  validates :property_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true
  validates :bedrooms, presence: true
end
