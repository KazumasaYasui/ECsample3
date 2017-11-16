Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :users, only:[:index, :show,]
  resources :categories, only:[:index, :show]
  resources :products

  post 'add_to_cart' => 'carts#add_to_cart'
  post 'update_cart' => 'carts#update_cart'
  delete 'delete_cart' => 'carts#delete_cart'
  get 'view_order' => 'carts#view_order'
  get 'checkout' => 'carts#checkout'
  post 'order_complete' => 'carts#order_complete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
