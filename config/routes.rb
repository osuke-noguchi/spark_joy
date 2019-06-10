Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'

  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
end
