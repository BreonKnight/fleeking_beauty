Rails.application.routes.draw do

  root to: "static_pages#index"
  resources :users
  # resources :places

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get "/vote", to: "votes#new", as: "voting"
  post "/vote", to: "votes#create"

  # get "/places", to: "places#index", as: "place"
  # get "places/:id", to: "places#show"
  resources :places
  get "/places/new", to: "places#new", as: "add_place"
  post "/places", to: "places#create"

  get "/about", to: "static_pages#about", as: "about"

end
