Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'users#index'
  resources :users do
      resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end
end
