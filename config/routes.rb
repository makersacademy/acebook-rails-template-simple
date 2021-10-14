Rails.application.routes.draw do
  get 'home/index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'posts', to: 'posts#index'
  get 'new_post', to: 'posts#new' 
  post 'posts', to: 'posts#index'
 

  root to: 'home#index'

  # resources :posts
end
