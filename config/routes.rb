Rails.application.routes.draw do
  root 'home#index'

  get '/users/verify', to: 'users#show_verify', as: 'verify'
  post '/users/verify'
  post '/users/resend'
  resources :users, only: [:new, :create, :edit, :update, :show] do
    resources :bookings, only: [:new, :create, :show]
    get '/reset_password', to: 'reset_password#edit', as: 'reset_password'
    patch '/reset_password', to: 'reset_password#update'
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  namespace :api do
    namespace :v1 do
      resources :listings, only: [:show] do
        resources :reviews, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end

  resources :listings, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end


  get '/dashboard', to: 'dashboard#show', path: ':user'
end
