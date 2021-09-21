Rails
  .application
  .routes
  .draw do
    root 'users#index', as: 'home'

    resources :posts
    resources :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
