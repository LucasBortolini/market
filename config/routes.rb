Rails.application.routes.draw do
  get 'home/index'

  scope :admin do
    resources :branches
    resources :products
    resources :employees
    resources :customers
    resources :storages
    resources :orders
  end

  root 'home#index'
end
