Rails.application.routes.draw do
  get 'home/index'
  resources :branches
  resources :products
  resources :employees
  resources :customers
  resources :storages
  resources :orders

  root 'home#index'
end
