Rails.application.routes.draw do  
  root 'home#index'
  mount Ckeditor::Engine => '/ckeditor' 
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
