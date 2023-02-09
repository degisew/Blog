Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  # Defines the root path route ("/")
  root 'users#index'
  resources :users do
    resources :posts
  end
end
