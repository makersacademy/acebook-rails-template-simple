Rails.application.routes.draw do

  root to: "users#index"

  # post "sessions", to: "sessions#"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "logout", to: "sessions#destroy"
  resources :posts, :users, :sessions
end

# GET   /users -    users#index -   display a list of all users
# GET   /users/new -    users#new - return an HTML form for creating a new users
# POST  /users -    users#create -  create a new users
# GET   /users/:id -    users#show -    display a specific users
# GET   /users/:id/edit -   users#edit -    return an HTML form for editing a users
# PATCH/PUT     /users/:id -    users#update -  update a specific users
# DELETE    /users/:id -    users#destroy - delete a specific users