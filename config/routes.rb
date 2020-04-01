Rails.application.routes.draw do
  devise_for :users
  get 'items/new'
  root 'sell#index'
  resources :users, only: [:show,:new]
  resources :cards, only: [:new, :show, :destroy] do
  end
  resources :items do
    collection do
      
      get "buy"
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end