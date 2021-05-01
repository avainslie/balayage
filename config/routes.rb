Rails.application.routes.draw do
  devise_for :users
  resources :friends #handles all things for CRUD
  get 'home/about'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end