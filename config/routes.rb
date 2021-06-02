Rails.application.routes.draw do

  get 'posts/update'
  get 'posts/destroy'
  root 'home#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :show, :update, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'newpost', to: 'posts#new', as: 'newpost'
  post 'newpost', to: 'posts#create'

end
