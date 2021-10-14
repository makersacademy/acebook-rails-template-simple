Rails.application.routes.draw do
  get 'home/index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  root to: 'home#index'

  # resources :posts
end
