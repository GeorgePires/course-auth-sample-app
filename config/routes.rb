Rails.application.routes.draw do
  root "tweets#index"

  resources :tweets, only: [:index, :show, :create, :destroy]
  resources :sessions, only: [:new, :create]
  delete :logout, to: "sessions#destroy"
  resources :users, only: [:new, :create, :show]
  resources :follows, only: [:index, :create, :destroy]
end
