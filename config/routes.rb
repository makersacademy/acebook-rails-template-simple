Rails.application.routes.draw do
#  get 'user/new'
 # get "/sign_up", to: "user#new"
  
 resources :posts, :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
