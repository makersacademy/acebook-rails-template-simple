Rails.application.routes.draw do
  post '/comments', to: "comments#index"
  get "/comments", to: "comments#index"
end


