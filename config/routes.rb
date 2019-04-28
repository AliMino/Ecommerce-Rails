Rails.application.routes.draw do
  resources :expiration_usages
  resources :expiration_dates
  resources :ratings
  resources :reviews
  resources :categories
  resources :brands
  resources :product_images
  resources :products
  resources :used_copons
  resources :copons
  resources :wish_lists
  resources :order_states
  resources :orders
  resources :shopping_carts
  resources :stores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
