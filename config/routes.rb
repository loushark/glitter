Rails.application.routes.draw do

  root 'home#index'

  resources :users
  resources :posts
  resources :sessions


  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'


end
