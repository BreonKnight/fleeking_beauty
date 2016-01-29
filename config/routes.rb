Rails.application.routes.draw do

  root to: "users#index"
  resources :users
  resources :places

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
