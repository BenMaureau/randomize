class Activity < ApplicationRecord
  has_many :slots, dependent: :destroy
  has_many :bookings, through: :slots
  has_many_attached :photos

  # validates :name, :address, :price_per_head, :activity_url, :longitude, :latitude, presence: true
  validates :name, :address, :price_per_head, presence: true # removed longitude latitude and activity url

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
