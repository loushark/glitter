Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'users/new'
  get 'users/create'
  root 'home#index'
end
