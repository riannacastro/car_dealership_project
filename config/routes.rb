Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# get '/cars', to: "cars#index"
# get '/cars/:id', to: "cars#show", as: 'car'
resources :cars
resources :brands do 
  resources :cars, only: [:new, :create, :index]
end
resources :users
get '/signup', to: "users#new"
post '/signup', to: "users#create"
end
