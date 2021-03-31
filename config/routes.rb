Rails.application.routes.draw do
  get '/dashboard', to: 'dashboard#index'
  get '/dashboard/shared/:token', to: 'dashboard#shared'

  resources :logs
  resources :expenses, only: [:new, :create, :index]
  resources :intakes, only: [:new, :create, :index]
  resources :tokens, only: [:create, :index, :show, :destroy]

  devise_for :users
  root 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
