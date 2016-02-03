Rails.application.routes.draw do

  root to: "static_pages#index"
  resources :users
  resources :places

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get "/vote", to: "votes#new"
  post "/vote", to: "votes#create"


  get "/about", to: "static_pages#about"
end
