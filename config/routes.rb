Rails.application.routes.draw do
  get 'likes/index'
  get 'likes/create'
  get 'likes/delete'
  get 'posts/index'
  get 'posts/create'
  get 'posts/update'
  get 'posts/delete'
  get 'users/index'
  get 'users/create'
  get 'users/update'
  get 'users/delete'
  get 'users/:id', to: "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
