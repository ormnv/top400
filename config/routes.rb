Rails.application.routes.draw do
  # get 'sessions/new'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'show/index'
  get 'songs/countdown'

  # get 'top400/index'
  resources :shows do
  	resources :songs
  end
  
  root 'top400#index'

  # get 'application/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
