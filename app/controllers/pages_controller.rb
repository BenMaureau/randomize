class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @activities = Activity.all
    @activities_names = ""
    @activities.each { |activity| @activities_names += "#{activity.name}," }
  end

  def random
    @activities = Activity.all
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        image_url: helpers.asset_url('Ellipse.png')
      }
    end
  end

  def select
    @activities = Activity.all
    @activity = @activities.sample
    raise
    redirect_to activity_path(@activity)
  end

  def custom_activity
    # if params([:indoor]) == true

    # end
    cat = []
    cat << "Sport" if params[:sport] == "true"
    cat << "Social" if params[:social] == "true"
    cat << "Culture" if params[:culture] == "true"
    cat << "Nature" if params[:nature] == "true"
    cat << "Bien être" if params[:bien_etre] == "true"
    cat << "Sensation" if params[:sensation] == "true"
    @activities = []
    cat.each do |c|
      @activities_filtered = Activity.where(indoor: params[:indoor]).where("price_per_head <= ?", params[:max_price].to_i).where(category: c)
      @activities_filtered.each do |activity|
        @activities << activity
      end
    end
    @activities.sample
  end
end

