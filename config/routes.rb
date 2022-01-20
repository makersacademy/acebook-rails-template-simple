Rails.application.routes.draw do

  resources :comments

  resources :posts do
    resources :likes
  end

  resources :signup

  resources :homepage
  
  root to: 'posts#index' 

  resources :photos

end


