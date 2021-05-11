Rails.application.routes.draw do
  root to: "static_pages#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :books
  resources :readers
  resources :users
  resources :loans
end
