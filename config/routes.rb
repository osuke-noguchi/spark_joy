Rails.application.routes.draw do
  root to: 'top#index'
  devise_for :users


  resources :users, only: [:show, :edit, :update, :destroy]

  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  resources :categories, only: [:index, :show]
  end
end
