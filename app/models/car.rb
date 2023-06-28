class Car < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings

  has_one_attached :picture

  validates :brand, :description, :color, :price_per_day, presence: true

  scope :search_by_brand, -> (brand) { where("brand ILIKE ?", "%#{query}%") if query.present? }
  scope :available_between, -> (start_date, end_date) {
    left_joins(:bookings)
    .where('bookings.start_date IS NULL OR (bookings.start_date NOT BETWEEN :start AND :end AND bookings.end_date NOT BETWEEN :start AND :end)',
     start: start_date, end: end_date) if start_date.present? && end_date.present? }
end
