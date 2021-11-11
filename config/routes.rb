Rails.application.routes.draw do
  root 'sessions#welcome'
  get 'likes/update'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  post '/posts/order', to: 'posts#order'
  get '/posts/search', to: 'posts#search_post'
  get '/posts/search/:search', to: 'posts#search', as: 'search'
  put '/posts/:id/like', to: 'posts#like', as: 'like'
  delete '/posts/:id/like', to: 'posts#destroy_like', as: 'unlike'
  get 'posts/:user_id/posts', to: 'posts#showSpecificUsersPost'
  post '/posts/:id/comment', to: 'comments#create', as: 'comment'

  resources :users, only: [:new, :create]
  resources :posts do
    resources :comments
  end
end
