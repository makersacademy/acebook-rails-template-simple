Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  root "home#index"


  
#   root "users#index"

  resources :users


  resources :posts do
    resources :comments
  end

end
