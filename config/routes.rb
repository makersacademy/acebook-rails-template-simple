Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # if login? 
#   root 'posts#index'
# else
  root 'posts#index', as: 'home' 
  # (controller/route)
  resources :posts
end
