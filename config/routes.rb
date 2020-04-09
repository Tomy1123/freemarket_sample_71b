Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'items/new'
  root 'sell#index'
  resources :users, only: [:show,:new]
  resources :cards, only: [:new, :show, :destroy] do
  end
  resources :items, only: [:new,:show , :create , :edit ,:update , :destroy] do
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
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
end
end

  end
  # delete  'item_images/:id'  => 'item_images#destroy'
end
