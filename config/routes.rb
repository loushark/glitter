Rails.application.routes.draw do
 root 'home#index'

 resources :users, only: [:new, :create]

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
end
