Rails.application.routes.draw do
  get 'logs/intake'
  get 'logs/expense'
  get 'logs/new_intake'
  get 'logs/new_expense'
  resources :logs
  
  devise_for :users
  root 'logs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
