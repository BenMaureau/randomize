class Booking < ApplicationRecord
  belongs_to :slot
  belongs_to :user
  has_one :review, dependent: :destroy
  has_many :notifications

  validates :number_of_people, presence: true
end
