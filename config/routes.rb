Rails.application.routes.draw do
  get '/admin', to: 'admin#index'
  get '/report', to: 'home#report'
  get '/products/:id', to: 'products#view', as: :product_view
  get '/products/:id/buy', to: 'products#buy', as: :product_buy

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
