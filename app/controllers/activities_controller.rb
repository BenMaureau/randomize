class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def show
    @activity = Activity.find(params[:id])
  end
end
