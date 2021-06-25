class BookingsController < ApplicationController
before_action :authenticate_user!, only: :new

  def my_bookings
    @my_bookings = Booking.where(user_id: current_user.id).order(created_at: :desc)
    @icon = "🎲"
  end

  def show
    @booking = Booking.find(params[:id])
    # @booking = Booking.slot.activity
  end

  def new
    raise
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.new
    @booking[:number_of_people] = 2
    @slot = @activity.slots.first
    @booking.user = current_user
    @booking.slot = @slot
    @booking.save!
    redirect_to my_booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:slot_id, :user_id)
  end
end
