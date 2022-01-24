Rails.application.routes.draw do

  resources :comments

  resources :posts do
    resources :likes
    resources :comments
    member do
      get 'personal'
    end
  end

  get '/profile', to: 'profile#index'

  resources :signup

  resources :homepage
  
  root to: 'posts#index' 

  resources :photos

end


