class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @activities = Activity.all
    @activities_names = ""
    @activities.each { |activity| @activities_names += "#{activity.name}," }
  end

  def search
    parameters = { term: params[:term], limit: 16 }
    render json: Yelp.client.search('San Francisco', parameters)
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
    redirect_to activity_path(@activity)
  end
end
