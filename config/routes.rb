Rails.application.routes.draw do
  root 'home#index'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get '/dashboard', to: 'dashboard#show'
  resources :users, only: [:new, :create]
  resources :listings, only: [:index, :show]
end
