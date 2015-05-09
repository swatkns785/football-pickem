Rails.application.routes.draw do
  root 'leagues#index'
  devise_for :users

  resources :leagues do
    resources :membership_requests, only: :create
    resources :memberships, only: [ :create, :destroy ]
  end
end
