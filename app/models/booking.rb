class Booking < ApplicationRecord
  belongs_to :slot
  belongs_to :user

  validates :number_of_people, presence: true
end
