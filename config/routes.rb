Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  
  resources :book

  #get '/8book' to: '8book#index'

end
