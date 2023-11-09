class Reservation < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :packages

  validates :reservation_date, presence: true
  validates :city_name, presence: true, length: { maximum: 20 }
  validates :package_name, presence: true, length: { maximum: 20 }
  validates :package_type, presence: true, length: { maximum: 20 }
end
