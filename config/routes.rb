Rails.application.routes.draw do
  root 'home#index'

  get '/users/verify', to: 'verify#show_verify', as: 'verify'
  post '/users/verify', to: 'verify#verify'
  post '/users/resend', to: 'verify#resend'

  namespace :admin do
    get '/dashboard', to: 'dashboard#show'
    resources :users, only: [:index, :show, :edit, :update]
    resources :listings, only: [:index, :show, :edit, :update, :destroy]
  end

  resources :users, only: [:new, :create, :edit, :update] do
    resources :bookings, only: [:index, :show]
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
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:create, :edit, :update, :destroy]
    resources :ratings, only: [:create]
  end

  get '/dashboard', to: 'dashboard#show'

  get '/:user', to: 'users#show', as: 'show_user'
end
