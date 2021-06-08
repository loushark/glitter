Rails.application.routes.draw do

  root 'home#index'

  resources :users
  resources :posts do
    resources :comments
    resources :likes
  end
  resources :sessions


  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'


end
