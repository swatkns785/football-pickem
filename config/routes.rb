Rails.application.routes.draw do
  root 'leagues#index'
  devise_for :users

  # resources :leagues

  # resources :leagues, only: :show do
  #   resources :league_membership_requests, only: :create
  # end

  resources :leagues do
   resources :membership_requests, only: :create
 end
end
