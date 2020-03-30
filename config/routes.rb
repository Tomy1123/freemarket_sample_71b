Rails.application.routes.draw do
  devise_for :users
  get "sessions/new"
  get 'items/new'
  root 'sell#index'
  resources :users, only: [:show,:new]
  resources :items do
    collection do
      get "buy"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
