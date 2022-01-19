Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/", to: "user#index"
  get "/signup", to: "signup#index"

  resources :posts do
    resources :comments
  end

end
