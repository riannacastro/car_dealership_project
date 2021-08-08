Rails.application.routes.draw do
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new"
  get '/login', to: "sessions#create"
resources :cars
resources :brands do 
  resources :cars, only: [:new, :create, :index]
end
resources :users
resources :countries
end
