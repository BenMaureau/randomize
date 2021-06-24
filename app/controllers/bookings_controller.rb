class BookingsController < ApplicationController
before_action :authenticate_user!, only: :new

  def my_bookings
    @my_bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Boooking.new(booking_params)

    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:slot_id, :user_id)
  end
end
