Rails.application.routes.draw do
  get '/auth/google_oauth2/callback', to: "sessions#omniauth"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  delete '/logout', to: "sessions#destroy"
  
resources :cars
resources :brands do 
  resources :cars, only: [:new, :create, :index]
end
resources :users
resources :countries
end
