Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # get "/", to: "users#index"
  # get "/signup", to: "signup#index"

  root "users#index"

  resources :users

  resources :posts do
    resources :comments
  end

end
