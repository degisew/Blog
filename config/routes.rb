Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  resources :users do
      resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
          resources :likes
        end
      end
    end
  end
  root 'users#index'
end
