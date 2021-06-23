Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/components', to: 'pages#components'
  resources :activities, except: [:index]
  resources :bookings

  get '/profile/my_bookings', to: 'bookings#my_bookings'
  get '/profile/my_bookings/:id', to: 'bookings#show', as: :my_booking do
    resources :reviews
  end

  get '/random', to: 'pages#random'
  get '/activity/:id', to: 'activities#show' do
    resources :bookings, only: [:new, :create]
  end
  delete '/profile/my_bookings', to: 'bookings#destroy'
end
