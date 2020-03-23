Rails.application.routes.draw do
  root 'sell#index'
  resources :users, only: [:new, :show] do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
