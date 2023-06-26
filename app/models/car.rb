class Car < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings

  has_one_attached :picture

  validates :brand, :description, :color, :price_per_day, :picture, presence: true
end
