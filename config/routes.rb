Rails.application.routes.draw do
  get 'items/new'
  root 'sell#index'
  resources :users, only: [:show,:new]
  resources :items, only: [:new,:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
