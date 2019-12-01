Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'
  resources :posts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
