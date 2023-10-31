class Package < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :reservations, dependent: :destroy
end
