Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
  root 'users#index'
end
