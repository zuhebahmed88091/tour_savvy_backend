class User < ApplicationRecord
  has_secure_password
  has_many :reservations, dependent: :destroy
  has_many :packages, dependent: :destroy
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 6 }

  def admin?
    admin
  end
end
