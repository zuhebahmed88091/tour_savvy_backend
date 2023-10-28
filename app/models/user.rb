class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :packages, through: :reservations
  validates :username, uniqueness: true, presence: true
end
