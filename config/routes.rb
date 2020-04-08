Rails.application.routes.draw do
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
  # delete  'item_images/:id'  => 'item_images#destroy'
end