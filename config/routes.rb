# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root to: 'main#index'
  
  get 'sign_ups', to: 'sign_ups#new'
  post 'sign_ups', to: 'sign_ups#create'

  get 'log_in', to: 'sessions#new'
  post 'log_in', to: 'sessions#create'

  delete 'log_out', to: 'sessions#delete'

  resources :posts do
    resources :likes
    resources :comments
  end

  namespace :api do
    namespace :v1 do
      resources :posts
      resources :sign_ups
    end
  end
  
end
