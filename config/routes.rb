Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  root "home#index"

  get 'friends_posts' =>  'posts#friends_feed'
  
#   root "users#index"

  resources :users
  resources :friendships, only: [:create, :destroy]

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end

end
