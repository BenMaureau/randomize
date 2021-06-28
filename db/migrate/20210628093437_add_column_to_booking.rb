class AddColumnToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :reveal, :boolean
  end
end
