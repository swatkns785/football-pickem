Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :leagues, only: [:index, :new, :create, :show]
end
