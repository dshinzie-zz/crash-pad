Rails.application.routes.draw do
  root 'home#index'
  get "/login", to: "sessions#new"
  get '/dashboard', to: 'dashboard#show'
  resources :users, only: [:new, :create]
  resources :listings, only: [:index, :show]
end
