class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :packages, dependent: :destroy
  validates :username, uniqueness: true, presence: true
end
