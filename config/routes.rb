Rails.application.routes.draw do
  get 'sell/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sell#index'
end
