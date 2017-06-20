Rails.application.routes.draw do

  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'

  # get 'users/new'

  # get 'users/create'

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create]

  get 'index', to: 'home#index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
