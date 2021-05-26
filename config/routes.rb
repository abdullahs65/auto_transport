Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :shuttle
  resources :user_shuttle_seats
  resources :shuttle_seats
  resources :user_shuttles do
    member do
      post :check_in
      post :check_out
      post :calculate_payment
    end 
  end
end
