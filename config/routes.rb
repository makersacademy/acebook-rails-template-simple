Rails.application.routes.draw do

  resources :comments

  resources :posts

  resources :signup

  resources :homepage
  
  root to: 'posts#index' 

  resources :photos

end


