Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  resources :users do
      resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end
  root 'users#index'
end
