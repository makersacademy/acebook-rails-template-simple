Rails
  .application
  .routes
  .draw do
    root to: 'main#index'

    post 'log_in', to: 'main#create'
    delete 'logout', to: 'main#destroy'

    # resources :posts do
    #   resources :likes
    # end

    resources :post_images do
      resources :comments
      resources :likes
    end
  end
