Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'items/new'
  root 'sell#index'
  resources :users, only: [:show,:new]
  resources :items do
    collection do
      
      get "buy"
    end
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  resources :purchase, only: [:index] do
    collection do
      post 'pay', to: 'purchase#pay'
    end
end
end

