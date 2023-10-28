class Package < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
