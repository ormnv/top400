Rails.application.routes.draw do
  # get 'sessions/new'

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'show/index'
  get 'songs/countdown'
  get 'standalone_tracklists/index'

  # get 'top400/index'
  resources :shows do
  	resources :songs
  end
  
  root 'top400#index'

  resources :sessions, only: [:create, :new] do
    collection do
      get :logout
    end
  end

  resources :standalone_tracklists

  # get 'application/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
