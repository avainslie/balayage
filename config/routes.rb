Rails.application.routes.draw do
  devise_for :users
  resources :stylists #handles all things for CRUD
  get 'home/about'
  root 'home#index'
  #get 'upload_gallery_image#upload'

  # get is a method, and the arguments are a string and hash
  #get '/upload', controller: 'upload_gallery_image', action: 'upload'

  # can also say something like:
  #get 'upload_gallery_image#upload'
  get '/upload' => 'upload_gallery_image#upload'

  #get 'upload_gallery_image#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
