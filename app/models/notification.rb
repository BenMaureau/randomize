class Notification < ApplicationRecord
  belongs_to :booking

  validates :content, :category, presence: true
end
