class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def show
    @activities = Activity.all
    @activity = @activities.sample
  end

  # def create
  #   @activity = Activity.new(activity_params)

  #   if @activity.save
  #     redirect_to activity_path, notice: "Your activity has been added successfully."
  #   else
  #     render 'new'
  #   end
  # end

  # def edit
  # end

  # def update
  #   @activity.update(boat_params)
  #   if @activity.save
  #     redirect_to activity_path(@activity), notice: "Your activity has been updated successfully."
  #   else
  #     render 'new'
  #   end
  # end

  # def destroy
  #   @activity.destroy

  #   redirect_to my_activities_path, notice: "Your activity has been deleted successfully."
  # end
end
