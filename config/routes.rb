Rails.application.routes.draw do
  root 'posts#index'

  resources :users
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
