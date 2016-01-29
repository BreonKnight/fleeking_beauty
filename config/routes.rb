Rails.application.routes.draw do

  root to: "users#index"
  resources :users

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get "/vote", to: "votes#new"
end
