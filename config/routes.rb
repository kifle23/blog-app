Rails.application.routes.draw do
  get 'likes/create'

  devise_for :users

  devise_scope :user do
    root 'users#index'
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :new, :create, :destroy] do
        resources :likes, only: [:create, :destroy]
        resources :comments, only: [:new, :create, :destroy]
      end
    end  
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show], defaults: {format: :json} do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end
end