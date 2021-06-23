class ReviewsController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def show
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to my_booking_path, notice: "Your review has been added successfully."
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
    @review.destroy

    redirect_to my_booking_path, notice: "Your review has been deleted successfully."
  end

  private

  def set_id
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :booking_id)
  end
end
