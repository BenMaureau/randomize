class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :create_notifications

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :notifications, through: :bookings
  has_many :slots, through: :bookings
  # has_many :activities, through: :slots

  has_one_attached :photo

  validates :first_name, :last_name, presence: true

  private

  def recipients
    #1er event: quand ils se loggent in
    User.all
  end

  def create_notifications
    users.each do |user|
      Notification.create(content: "Bienvenue sur Randomize ! On se la joue comment ?", type: "Welcome", read: false)
    end
  end
end
