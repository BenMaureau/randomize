class RemoveNotificationreadFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :Notificationread
  end
end
