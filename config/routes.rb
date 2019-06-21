Rails.application.routes.draw do
  devise_for :admins, controllers: {
     sessions:      'admins/sessions',
     passwords:     'admins/passwords',
     registrations: 'admins/registrations'
  }

  root to: 'top#index'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  resources :categories, only: [:index, :show]
  end

  namespace :admins do
      root to: 'admins#index'
      resources :users, only: [:index,:show, :edit, :update, :destroy]
      resources :items, only: [:index,:show, :edit, :update, :destroy]
      resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    end
end
