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
    # @notifications = Notification.where(recipient: current_user).unread
    if current_user
      current_user.slots.each do |slot|
        if slot.end_date > Date.today
          @booking = Booking.find_by(slot: slot, user: current_user)
          unless Notification.find_by(slot: slot, booking: @booking, category: "feedback")
            Notification.create!(content: "On espère que tu t'es éclaté à #{slot.activity.name}! Laisse un avis", booking: @booking, category: "feedback")
          # Notification.create!(content: "On espère que tu t'es éclaté à #{slot.activity.name}! Laisse un avis", booking: @booking, category: "feedback", user: current_user)
          end
        end
      end
    end
    # @counter = current_user.notifications.count
  end
end
