Rails.application.routes.draw do

  resources :comments
  resources :posts

  resources :signup

  resources :homepage
end


