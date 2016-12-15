Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  get '/dashboard', to: 'dashboard#show'
  resources :users, only: [:new, :create]
end
