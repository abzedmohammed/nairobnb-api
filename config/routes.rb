Rails.application.routes.draw do
  resources :bnb_rooms
  resources :bnb_users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/login", to: "bnb_users#login"
end

  
    