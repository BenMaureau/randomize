class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_notifications
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birth_date, :phone_number, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birth_date, :phone_number, :photo])
  end

  def set_notifications
    #Cas 1: notifications quand l'utilisateur a fait l'activité
    @notifications = Notification.where(user: current_user)
    if current_user
      current_user.slots.each do |slot|
        if slot.end_date < Date.today
          @booking = Booking.find_by(slot: slot, user: current_user)
          unless Notification.find_by(booking: @booking, category: "feedback")
            Notification.create!(content: "Tu t'es éclaté? Note #{slot.activity.name}!", booking: @booking, category: "feedback")
          end
        end
      end
      @counter = current_user.notifications.where(read: false).count

    end
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
