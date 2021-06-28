Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/components', to: 'pages#components'
  resources :activities, except: [:index]
  resources :bookings

  get '/profile/my_bookings', to: 'bookings#my_bookings'
  get '/profile/my_bookings/:id', to: 'bookings#show', as: :my_booking
  get '/profile/my_bookings/:booking_id/reviews/new', to: 'reviews#new', as: :new_review
  post'/profile/my_bookings/:booking_id/reviews/', to: 'reviews#create', as: :create_review
  delete '/profile/reviews/:id', to: 'reviews#destroy', as: :destroy_review

  post '/custom_activity', to: 'pages#custom_activity'
  get '/random', to: 'pages#random'
  get '/select', to: 'pages#select'

  get '/activity/:id', to: 'activities#show' do
    resources :bookings, only: [:new, :create]
  end
  delete '/profile/my_bookings', to: 'bookings#destroy'
end
