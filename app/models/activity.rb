class Activity < ApplicationRecord
  has_many :slots
  has_many :bookings, through: :slots
  has_many_attached :photos

  validates :name, :address, :price_per_head, :activity_url, :longitude, :latitude, presence: true
end
