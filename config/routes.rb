Rails.application.routes.draw do
  root 'sell#index'
  resources :users, only: [:show,:new]
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
