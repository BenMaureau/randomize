class Slot < ApplicationRecord
  belongs_to :activity
  has_many :bookings
  has_many :users, through: :bookings

  validates :start_date, :end_date, :max_number_of_people, presence: true
end
