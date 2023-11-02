class User < ApplicationRecord
  has_secure_password
  has_many :reservations, dependent: :destroy
  has_many :packages, dependent: :destroy
  validates :username, uniqueness: true, presence: true
  def admin?
    admin
  end
end
