class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @activities = Activity.all.sample(50)
    @activities_banner = @activities.first(25)
    @activities_carousel = @activities.last(25)
    @activities_names = ""
    @activities_banner.each { |activity| @activities_names += "#{activity.name}," }

    @best_reviews = Review.where("rating >= ?", 4).order(created_at: :desc).first(15)
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
        image_url: helpers.asset_url('Logo.png')
      }
    end
  end

  def select
    @activities = Activity.all
    if params[:two_people] == "true"
      @activities = @activities.filter do |activity|
        answer = false
        activity.slots.each do |slot|
          answer = true if slot.max_number_of_people >= 2
        end
        answer
      end
    end

    @activity = @activities.sample
    redirect_to activity_path(@activity, nb_people: @nb_people)
  end

  def custom_activity
    @nb_people = params[:two_people] == "true" ? 2 : 1
    if params[:aventurier] == "true"
      select
    else
      cat = []
      cat << "Sport" if params[:sport] == "true"
      cat << "Manger" if params[:manger] == "true"
      cat << "Sortir" if params[:sortir] == "true"
      cat << "Nature" if params[:nature] == "true"
      cat << "Bien être" if params[:bien_etre] == "true"
      cat << "Se divertir" if params[:se_divertir] == "true"
        if (params[:indoor] == "true" && params[:outdoor] == "true" || params[:indoor] == "false" && params[:outdoor] == "false")
          if (cat.empty?)
            if (params[:max_price].empty?)
              @activities = Activity.all
            else
              @activities = Activity.where("price_per_head <= ?", params[:max_price].to_i)
            end
          else
            if (params[:max_price].empty?)
              @activities = Activity.where(category: cat)
            else
              @activities = Activity.where(category: cat).where("price_per_head <= ?", params[:max_price].to_i)
            end
          end

        else
          if (cat.empty?)
            if (params[:max_price].empty?)
              @activities = Activity.where(indoor: params[:indoor])
            else
              @activities = Activity.where("price_per_head <= ?", params[:max_price].to_i).where(indoor: params[:indoor])
            end
          else
            if (params[:max_price].empty?)
              @activities = Activity.where(category: cat).where(indoor: params[:indoor])
            else
              @activities = Activity.where(category: cat).where("price_per_head <= ?", params[:max_price].to_i).where(indoor: params[:indoor])
            end
          end
        end

        # @activities_filtered.each do |activity|
        #   @activities << activity
        # end
      # end

      if params[:two_people] == "true"
        @activities = @activities.filter do |activity|
          answer = false
          activity.slots.each do |slot|
            answer = true if slot.max_number_of_people >= 2
          end
          answer
        end
      end

      @activity = @activities.sample
      redirect_to activity_path(@activity, nb_people: @nb_people) if @activities.size > 0
    end
  end
end
