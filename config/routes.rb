Rails.application.routes.draw do
  get 'likes/create'

  devise_for :users

  devise_scope :user do
    root 'users#index'
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :likes, only: [:create]
      resources :comments, only: [:new, :create]
    end
  end  
end