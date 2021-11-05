Rails.application.routes.draw do
  get 'likes/update'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  put '/posts/:id/like', to: 'posts#like', as: 'like'
  get 'posts/:user_id/posts', to: 'posts#showSpecificUsersPost'

  resources :users, only: [:new, :create]
  resources :posts
  resources :post do
    resources :comments
  end
end
