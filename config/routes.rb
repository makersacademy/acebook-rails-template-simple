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
  get 'posts/:user_id/posts', to: 'posts#show_specific_users_post'
  delete '/posts/:id/like', to: 'posts#destroy_like', as: 'unlike'
  post '/posts/:id/comment', to: 'comments#create', as: 'comment'
  get '/dark', to: 'application#dark', as: 'dark'
  get '/light', to: 'application#light', as: 'light'

  resources :users, only: [:new, :create]
  resources :posts do
    resources :comments
  end
end
