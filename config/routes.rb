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
end