Rails.application.routes.draw do
  resources :user_infos
  
   devise_for :users
  
  root to: "posts#index"

  resources :posts, only: [:new, :create, :show , :index ,:destroy] do
    resources :likes 
    resources :comments
  end

resources :comments
  


end
