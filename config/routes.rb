Rails.application.routes.draw do
  root 'leagues#index'
  devise_for :users

  resources :leagues do
    resources :membership_requests, only: :create
    resources :memberships, only: [ :create, :destroy ]
    resources :league_weeks, only: :show
    resources :league_picks, only: :show
  end

  resources :league_weeks, only: :show do
    resources :league_picks, only: [ :new, :create ]
  end
end
