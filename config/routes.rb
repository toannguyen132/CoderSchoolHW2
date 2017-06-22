Rails.application.routes.draw do

  # get 'messages/index'

  # get 'messages/new'

  # get 'messages/create'

  # get 'messages/show'

  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'

  # get 'users/new'

  # get 'users/create'

  get 'add_friend', to: 'friendships#new'

  resources :friendships, only: [:new, :create]

  get 'messages', to: 'messages#index'

  resources :messages, only: [:index, :new, :create, :show]

  delete 'log_out', to: 'sessions#destroy'

  resources :sessions, only: [:new, :create]

  resources :users, only: [:new, :create]

  get 'index', to: 'home#index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
