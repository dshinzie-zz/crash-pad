Rails.application.routes.draw do
  root 'home#index'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get '/dashboard', to: 'dashboard#show'
  resources :users, only: [:new, :create]
  resources :listings, only: [:index, :show]
end
