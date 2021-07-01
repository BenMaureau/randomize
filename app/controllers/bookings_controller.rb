class BookingsController < ApplicationController
before_action :authenticate_user!, only: :new

  def my_bookings
    if params[:notification]
      @notification = Notification.find(params[:notification])
      @notification.read = true
      @notification.save!
      # @counter = params[:counter].to_i - 1
      @counter = current_user.notifications.where(read: false).count

    end
    @my_bookings = Booking.where(user_id: current_user.id).order(created_at: :desc)
    @my_bookings_reviewed = []
    @my_bookings_to_review = []
    @my_bookings.each do |booking|
      if booking.review.nil?
        @my_bookings_to_review << booking
      else
        @my_bookings_reviewed << booking
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @guests = "ta copine, ton partenaire, ton chien, ta mamie, ton amoureuse, Rémi Carette"
  end

  def new
  end

  def invitation
    @booking = Booking.find(params[:guest][:booking])
    GuestMailer.with(current_user).invitation(params[:email], @booking).deliver_now
    redirect_to profile_my_bookings_path
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @reveal = params[:reveal]
    @booking = Booking.new
    @booking[:number_of_people] = params[:nb_people]
    @slot = @activity.slots.first
    @booking.user = current_user
    @booking.slot = @slot
    @booking.reveal = @reveal
    @booking.save
    redirect_to my_booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:slot_id, :user_id, :reveal)
  end
end
