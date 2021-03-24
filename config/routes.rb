Rails.application.routes.draw do
  root 'products#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'inquiries/edit'
  get 'inquiries/index'
  get 'inquiries/new'
  get 'item/pay'
  get 'item/sale'
  get 'line_items/purchasehistory'


  resources :inquiries
  resources :line_items
  resources :carts
  resources :products
  get 'registrations/registration'
  devise_for :users, controllers:{
   registrations: 'registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
