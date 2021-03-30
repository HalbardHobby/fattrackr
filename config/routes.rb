Rails.application.routes.draw do

  resources :logs
  resources :expenses, only: [:new, :create, :index]
  resources :intakes, only: [:new, :create, :index]

  devise_for :users
  root 'logs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
