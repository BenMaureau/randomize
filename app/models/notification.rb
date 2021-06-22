class Notification < ApplicationRecord
  belongs_to :booking

  validates :content, :type, presence: true
end
