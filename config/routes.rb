Rails.application.routes.draw do
  root 'home#index'

  get '/users/verify', to: 'users#show_verify', as: 'verify'
  post '/users/verify'
  post '/users/resend'

  namespace :admin do
    get '/dashboard', to: 'dashboard#show'
    resources :users, only: [:index]
    resources :listings, only: [:index]
  end

  resources :users, only: [:new, :create, :edit, :update, :show] do
    resources :bookings, only: [:new, :create, :show]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  get '/dashboard', to: 'dashboard#show'

  resources :listings, only: [:index, :show]
end
