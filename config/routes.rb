Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :users, only:[:index, :show,] do
    get 'mypage', on: :member
  end
  resources :categories, only:[:index, :show]
  resources :products

  post 'add_to_cart', to: 'carts#add_to_cart'
  post 'update_cart', to: 'carts#update_cart'
  delete 'delete_cart', to: 'carts#delete_cart'
  get 'view_order', to: 'carts#view_order'
  get 'checkout', to: 'carts#checkout'
  patch 'order_complete', to: 'carts#order_complete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
