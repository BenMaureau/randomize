class BookingsController < ApplicationController
before_action :authenticate_user!, only: :new

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @activity = Activity.find(params[:activity_id])
  end
end
