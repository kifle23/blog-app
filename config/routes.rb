Rails.application.routes.draw do
  get 'likes/create'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create] do
      resources :likes, only: [:create]
      resources :comments, only: [:create]      
    end
  end
  root 'users#index'
end
