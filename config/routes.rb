Rails.application.routes.draw do

  resources :comments
  
  resources :posts do
    resources :likes
    resources :comments
  end

  resources :signup

  resources :homepage
  
  root to: 'posts#index' 

  resources :photos

  delete 'logout', to: 'homepage#destroy'
end


