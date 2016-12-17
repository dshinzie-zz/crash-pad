Rails.application.routes.draw do
  root 'home#index'

  get '/users/verify', to: 'users#show_verify', as: 'verify'
  post '/users/verify'
  post '/users/resend'
  resources :users, only: [:new, :create, :edit, :update, :show] do
    resources :bookings, only: [:new, :create, :show]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  get '/dashboard', to: 'dashboard#show'

  resources :listings, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end
  get '/search', to: "search#index"
end
