Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords"
  }

  root "dashboard#index"

  resources :locales
  resources :customers
  resources :products
end
