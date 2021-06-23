class BookingsController < ApplicationController
before_action :authenticate_user!, only: :new

  def my_bookings
    @my_bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @review = Review.new
  end

  private

  def booking_params
    params.require(:booking).permit(:slot_id)
  end
end
