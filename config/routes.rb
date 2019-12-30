Rails.application.routes.draw do 
  resources :comments
  devise_for :users
  resources :users
  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'
  
  
  resources :posts do 
    resources :comments
    resources :likes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
