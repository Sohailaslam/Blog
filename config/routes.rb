Rails.application.routes.draw do
  
  root 'categories#index'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :categories
  resources :posts
  resources :comments
  resources :users
  
end
