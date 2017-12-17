Rails.application.routes.draw do
  devise_for :customers, :controllers => {registrations: 'customer/registrations'}
  resources :orders
  resources :shipping_methods
  resources :payment_methods
  devise_for :admin

  namespace :admin do
    root 'dashboard#index'
    resources :products
    resources :categories
    resources :brands
    resources :orders
  end

  namespace :customer do
    root 'dashboard#index'
    resources :orders
    resources :account
  end

  get 'cart_items/create'

  get 'cart_items/update'

  get 'cart_items/destroy'

  resources :carts, path: '/cart', only: [:index, :index]
  resources :categories do
    collection do
      post 'filter_products', action: :filter_products
      post 'order_products', action: :order_products
    end
  end
  resources :brands
  resources :products
  resources :cart_items, only: [:create, :update, :destroy]

  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
