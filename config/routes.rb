Rails.application.routes.draw do
  root 'bars#index'
  devise_for :users

  resources :bars, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end
end
