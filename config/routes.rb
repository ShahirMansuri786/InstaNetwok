Rails.application.routes.draw do
  
  devise_for :users

  resources :user_infos
  #  root to: "posts#index"

  resources :posts, only: [:new, :create, :show , :index ,:destroy] do
    resources :likes 
    resources :comments
  end

  resources :user_profiles
  
  resources :users do
    collection do
      get :user_search
      get :user_followed
      get :user_follower
    end
    resources :relationships , only: [:create ]
  end

  resources :relationships , only: [:destroy]

  get "users/:id/user_edit" , to: "users#user_edit" , as: "user_edit" 
  post  "users/:id/user_update" , to: "users#user_update" , as: "user_update"
  get "users/:id/show_user" , to: "users#show_user" , as: "show_user" 
  
  
  resources :messages
  resources :rooms

  root to: 'rooms#index'

  # devise_scope :user do  
  #   get '/users/sign_out' => 'devise/sessions#destroy'     
  #  end

end
