Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'posts/:user_id/posts', to: 'posts#showSpecificUsersPost'

  resources :users, only: [:new, :create]
  resources :posts
end
