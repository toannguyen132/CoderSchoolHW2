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

  match 'auth/:provider/callback', to: 'sessions#callback', via: [:get, :post], as: 'auth_callback'

  get 'add_friend', to: 'friendships#new'

  delete 'remove_friend/:id', to: 'friendships#destroy'

  resources :friendships, only: [:create, :destroy]
  resources :blocked_users, only: [:create, :destroy]

  get 'messages', to: 'messages#index'

  get 'messages/sent', to: 'messages#sent'

  resources :messages, only: [:index, :new, :create, :show]

  delete 'log_out', to: 'sessions#destroy'

  resources :sessions, only: [:new, :create]

  resources :users, only: [:new, :create, :index]

  get 'index', to: 'home#index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
