Rails.application.routes.draw do
  root 'home#index'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get '/dashboard', to: 'dashboard#show'
  resources :users, only: [:new, :create, :edit, :update] do
    resources :bookings, only: [:new, :create, :show]
  end
  resources :listings, only: [:index, :show]
end
