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

  def custom_activity
    cat = []
    cat << "Sport" if params[:sport] == "true"
    cat << "Manger" if params[:manger] == "true"
    cat << "Sortir" if params[:sortir] == "true"
    cat << "Nature" if params[:nature] == "true"
    cat << "Bien être" if params[:bien_etre] == "true"
    cat << "Se divertir" if params[:se_divertir] == "true"
    @activities = []
    cat.each do |c|
      @activities_filtered = Activity.where(indoor: params[:indoor]).where("price_per_head <= ?", params[:max_price].to_i).where(category: c)
      @activities_filtered.each do |activity|
        @activities << activity
      end
    end
    @activity = @activities.sample
    redirect_to activity_path(@activity) if Dir.exist?('activity_path') == true
  end
end

