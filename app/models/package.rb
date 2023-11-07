class Package < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 100 }
  validates :image, presence: true
  validates :package_type, presence: true
end
