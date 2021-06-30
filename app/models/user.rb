class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :notifications, through: :bookings
  has_many :slots, through: :bookings
  # has_many :activities, through: :slots

  has_one_attached :photo

  validates :first_name, :last_name, presence: true

end
