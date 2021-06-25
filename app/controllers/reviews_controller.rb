class ReviewsController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
  end

  def show
  end

  def create
    @rating = params[:review][:rating]
    if @rating.split(" ").length != 1
      @rating = @rating.split(" ").first + ".5"
      params[:review][:rating] = @rating
    end
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to profile_my_bookings_path, notice: "Your review has been added successfully."
    else
      render 'new'
    end
  end

  def update
    @review.update(review_params)
    if @review.save
      redirect_to review_path(@review), notice: "Your review has been updated successfully."
    else
      render 'new'
    end
  end

  def destroy
    @booking = @review.booking
    @review.destroy

    redirect_to my_booking_path(@booking), notice: "Your review has been deleted successfully."
  end

  private

  def set_id
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :booking_id)
  end
end
