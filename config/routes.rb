Rails.application.routes.draw do
  get 'sessions/new'

  # get 'users/new'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'show/index'

  # get 'top400/index'
  resources :shows do
  	resources :songs
  end

  # get    '/signup',  to: 'users#new'
  # get    '/login',   to: 'sessions#new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'
  # resources :users
  
  root 'top400#index'
  # devise_for :user

  # get 'application/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
