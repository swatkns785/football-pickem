Rails.application.routes.draw do
  root 'leagues#index'
  devise_for :users

  resources :leagues, only: [:index, :new, :create, :show]
end
